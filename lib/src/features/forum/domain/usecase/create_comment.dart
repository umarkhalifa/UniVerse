import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/forum/data/model/tweet_model.dart';
import 'package:uni_verse/src/features/forum/data/repository/feed_repo_impl.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class CreateCommentParams {
  final TweetModel tweet;
  final String level;

  CreateCommentParams(this.tweet, this.level,);
}

class CreateCommentUseCase extends UseCase<Tweet, CreateCommentParams> {
  final FeedRepositoryImpl _repositoryImpl;

  CreateCommentUseCase(this._repositoryImpl);

  @override
  Future<Either<Failure, Tweet>> call(CreateCommentParams params) async {
    return await _repositoryImpl.addComment(
        tweet: params.tweet, level: params.level,);
  }
}

final createCommentCaseProvider = Provider((ref) {
  return CreateCommentUseCase(ref.read(feedRepoProvider));
});