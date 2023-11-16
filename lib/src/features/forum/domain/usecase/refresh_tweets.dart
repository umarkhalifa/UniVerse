import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/forum/data/repository/feed_repo_impl.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class RefreshTweetParams {
  final String level;
  final Set<String> tweetIds;

  RefreshTweetParams(this.level, this.tweetIds);
}

class RefreshTweetUseCase extends UseCase<List<Tweet>, RefreshTweetParams> {
  final FeedRepositoryImpl _repositoryImpl;

  RefreshTweetUseCase(this._repositoryImpl);

  @override
  Future<Either<Failure, List<Tweet>>> call(RefreshTweetParams params) async {
    return await _repositoryImpl.refreshTweets(
      level: params.level,tweetIds: params.tweetIds
    );
  }
}

final refreshTweetCaseProvider = Provider((ref) {
  return RefreshTweetUseCase(ref.read(feedRepoProvider));
});
