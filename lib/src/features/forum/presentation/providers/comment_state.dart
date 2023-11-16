import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/features/home/presentation/providers/home_state.dart';

class CommentState {
  final AppState? appState;
  final List<Tweet>? comments;
  final int? lastId;
  final String? lastTweetId;

  CommentState({this.appState, this.comments,this.lastId,this.lastTweetId});

  CommentState.initial({
    this.appState = AppState.idle,
    this.comments = const [],
    this.lastId = 0,
    this.lastTweetId = ''
  });

  CommentState copyWith({
    AppState? appState,
    List<Tweet>? comments,
    int? lastId,
    String? lastTweetId,
  }) {
    return CommentState(
      appState: appState ?? this.appState,
      comments: comments ?? this.comments,
      lastId: lastId ?? this.lastId,
      lastTweetId: lastTweetId ?? this.lastTweetId


    );
  }
}
