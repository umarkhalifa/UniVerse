import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/forum/data/model/tweet_model.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/features/forum/domain/usecase/create_comment.dart';
import 'package:uni_verse/src/features/forum/domain/usecase/fetch_comments.dart';
import 'package:uni_verse/src/features/forum/presentation/providers/comment_state.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_provider.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';
import 'package:uni_verse/src/utils/snackbar.dart';

class CommentNotifier extends StateNotifier<CommentState> {
  CommentNotifier(
      this._createCommentUseCase, this._fetchCommentUseCase, this._ref)
      : super(CommentState.initial());

  final CreateCommentUseCase _createCommentUseCase;
  final FetchCommentUseCase _fetchCommentUseCase;
  final Ref _ref;

//  ! FETCH COMMENTS
  Future<void> fetchComments({required Tweet tweet}) async {
    // SET LOADING
    state = state.copyWith(appState: AppState.loading);
    final data = _fetchCommentUseCase.call(
      FetchCommentParams(
          _ref.read(homeNotifier).userEntity?.level ?? '', tweet.id!),
    );
    //
    data.listen((event) {
      state = event.fold((l) {
        _ref.read(snackBarProvider).showErrorMessageSnackBar(l.message);
        return state.copyWith(appState: AppState.error);
      }, (r) {
        return state.copyWith(comments: r, appState: AppState.idle);
      });
    });
  }

  Future<void> addComment(String content, String id) async {
    state = state.copyWith(appState: AppState.loading);
    final tweetModel = TweetModel(
        content: content,
        image: '',
        comments: 0,
        likes: 0,
        color: _ref.read(homeNotifier).userEntity?.color,
        name: FirebaseAuth.instance.currentUser?.displayName,
        userName: _ref.read(homeNotifier).userEntity!.userName!,
        profileImage: _ref.read(homeNotifier).userEntity!.avatar!,
        timestamp: Timestamp.now(),
        tweetId: id);
    final data = await _createCommentUseCase.call(CreateCommentParams(
      tweetModel,
      _ref.read(homeNotifier).userEntity?.level ?? '',
    ));
    state = data.fold((l) {
      _ref.read(snackBarProvider).showErrorMessageSnackBar(l.message);
      return state;
    }, (r) {
      return state.copyWith(appState: AppState.idle);
    });
  }
}

final commentNotifier =
    StateNotifierProvider<CommentNotifier, CommentState>((ref) {
  final create = ref.read(createCommentCaseProvider);
  final fetch = ref.read(fetchCommentCaseProvider);
  return CommentNotifier(create, fetch, ref);
});

final chatProvider = StreamProvider.family<List<Tweet>,String>((ref,comment) async* {
    yield* FirebaseFirestore.instance
        .collection("COMMENT")
        .doc('SOFTWARE ENGINEERING')
        .collection(ref.read(homeNotifier).userEntity!.level!.toUpperCase())
        .where('tweetId', isEqualTo: comment)
        .snapshots()
        .map((event) =>
        event.docs.map((e) => TweetModel.fromFirestore(e)).toList());
});

