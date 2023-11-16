import 'package:uni_verse/src/features/forum/domain/entity/like_post.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';

class FeedState {
  final List<Tweet>? feed;
  final AppState? appState;
  final String? file;
  final bool? hasMore;
  final Set<String>? tweetIds;
  final List<LikePost>? likes;


  FeedState({this.feed, this.appState, this.file, this.hasMore, this.tweetIds,this.likes});

  FeedState.initial(
      {this.feed = const [],
      this.appState = AppState.idle,
      this.file = '',
      this.hasMore = false,
      this.tweetIds = const {},
      this.likes  = const []});

  FeedState copyWith({
    List<Tweet>? feed,
    AppState? appState,
    String? file,
    bool? hasMore,
    Set<String>? tweetIds,
    List<LikePost>? likes,
  }) {
    return FeedState(
      feed: feed ?? this.feed,
      appState: appState ?? this.appState,
      file: file ?? this.file,
      hasMore: hasMore ?? this.hasMore,
      tweetIds: tweetIds ?? this.tweetIds,
      likes: likes ?? this.likes,
    );
  }
}
