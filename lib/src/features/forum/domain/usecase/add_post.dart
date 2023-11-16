import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/forum/data/model/tweet_model.dart';
import 'package:uni_verse/src/features/forum/data/repository/feed_repo_impl.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class UploadPostParams {
  final TweetModel tweet;
  final String level;

  UploadPostParams(this.tweet, this.level);
}

class UploadPostUseCase extends UseCase<Tweet, UploadPostParams> {
  final FeedRepositoryImpl _repositoryImpl;

  UploadPostUseCase(this._repositoryImpl);

  @override
  Future<Either<Failure, Tweet>> call(UploadPostParams params) async {
    return await _repositoryImpl.uploadPost(
        tweet: params.tweet, level: params.level);
  }
}

final uploadPostCaseProvider = Provider((ref) {
  return UploadPostUseCase(ref.read(feedRepoProvider));
});