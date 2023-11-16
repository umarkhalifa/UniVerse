import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uni_verse/src/core/router/router.dart';
import 'package:uni_verse/src/features/forum/data/model/tweet_model.dart';
import 'package:uni_verse/src/features/forum/domain/entity/like_post.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/features/forum/domain/usecase/usecase.dart';
import 'package:uni_verse/src/features/forum/presentation/providers/feed_state.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_provider.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';
import 'package:uni_verse/src/utils/snackbar.dart';

import '../../data/data_source/feed_data_source.dart';

class FeedProvider extends StateNotifier<FeedState> {
  FeedProvider(
      this._uploadPostUseCase,
      this._ref,
      this._fetchLikes,
      this._likeTweet,
      this._unLikeTweet)
      : super(FeedState.initial()) {
    fetchLikes();
  }

  final UploadPostUseCase _uploadPostUseCase;
  final FetchLikes _fetchLikes;
  final LikeTweet _likeTweet;
  final UnLikeTweet _unLikeTweet;
  final Ref _ref;


  ///  UPDATE TWEET

// ! UPLOAD POST
  Future<void> uploadPost({String? content}) async {
    /// Set state to loading
    state = state.copyWith(appState: AppState.loading);

    /// Create an instance of the tweet to be added
    final tweetModel = TweetModel(
        content: content ?? '',
        image: state.file ?? '',
        comments: 0,
        likes: 0,
        color: _ref.read(homeNotifier).userEntity?.color,
        name: FirebaseAuth.instance.currentUser?.displayName,
        userName: _ref.read(homeNotifier).userEntity!.userName!,
        profileImage: _ref.read(homeNotifier).userEntity!.avatar!,
        timestamp: Timestamp.fromMillisecondsSinceEpoch(
          DateTime.now().millisecondsSinceEpoch,
        ),
        tweetId: '');

    /// Make add tweet request
    final data = await _uploadPostUseCase.call(
      UploadPostParams(
        tweetModel,
        _ref.read(homeNotifier).userEntity?.level ?? '',
      ),
    );

    /// Handle scenario where the request fails
    state = data.fold(
      (l) {
        /// Display snack bar with error message
        _ref.read(snackBarProvider).showErrorMessageSnackBar(l.message);
        return state.copyWith(appState: AppState.error);
      },
      (r) {
        /// Pop out of the add post screen then append the new tweet added to
        /// the top of the tweets list;
        navigatorKey.currentState?.pop();

        return state.copyWith(
            appState: AppState.idle,
            feed: [
              ...[r],
              ...state.feed!
            ],
            file: '',
            tweetIds: {
              ...{r.id!},
              ...state.tweetIds!
            });
      },
    );
  }

// REFRESH TWEETS

//  ! FETCH LIKES
  Future<void> fetchLikes() async {
    final data = await _fetchLikes.call(null);
    data.fold(
      (l) => null,
      (r) {
        state = state.copyWith(likes: r);
      },
    );
  }

//  ! LIKE TWEET
  Future<void> likeTweet({required String postId}) async {
    final data = await _likeTweet.call(
        LikeParams(postId, _ref.read(homeNotifier).userEntity?.level ?? ''));
    data.fold(
      (l) => null,
      (r) => state = state.copyWith(
        likes: [
          ...[
            LikePost(
              id: r,
              postId: postId,
            )
          ],
          ...state.likes!
        ],
      ),
    );
  }

//  ! DISLIKE TWEETS
  Future<void> unLikeTweet({required String postId, required int id}) async {
    final data = await _unLikeTweet.call(
      UnlikeParams(
        postId,
        _ref.read(homeNotifier).userEntity?.level ?? '',
        state.likes!.elementAt(id).id!,
      ),
    );
    data.fold(
      (l) => null,
      (r) {
        state = state.copyWith(
          likes: state.likes!
              .where((element) => element.postId != postId)
              .toList(),
        );
      },
    );
  }

//  ! SELECT IMAGE
  Future<void> selectImage() async {
    if (state.file != '') {
      state = state.copyWith(file: '');
    } else {
      final data = await ImagePicker().pickImage(source: ImageSource.gallery);
      data != null ? state = state.copyWith(file: data.path) : null;
    }
  }
}

final feedNotifier = StateNotifierProvider<FeedProvider, FeedState>((ref) {
  final upload = ref.read(uploadPostCaseProvider);
  final fetchLike = ref.read(fetchLikesCaseProvider);
  final likeTweet = ref.read(likeTweetCaseProvider);
  final unLike = ref.read(dislikeTweetCaseProvider);
  return FeedProvider(
      upload,  ref,  fetchLike, likeTweet, unLike);
});

final tweetStream = StreamProvider<List<Tweet>>(
  (ref) {
    final level = ref.read(homeNotifier).userEntity?.level ?? '';
    final repo = ref.read(feedDataProvider);
    return repo.streamTweets(level: level);
  },
);
