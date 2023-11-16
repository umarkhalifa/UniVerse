import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/forum/data/repository/feed_repo_impl.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class FetchTweetParams {
  final String level;
  final String lastId;

  FetchTweetParams(this.level, this.lastId);
}

class FetchTweetUseCase extends UseCase<List<Tweet>, FetchTweetParams> {
  final FeedRepositoryImpl _repositoryImpl;

  FetchTweetUseCase(this._repositoryImpl);

  @override
  Future<Either<Failure, List<Tweet>>> call(FetchTweetParams params) async {
    return await _repositoryImpl.fetchTweets(
        level: params.level, lastId: params.lastId);
  }
}

final fetchTweetCaseProvider = Provider((ref) {
  return FetchTweetUseCase(ref.read(feedRepoProvider));
});
