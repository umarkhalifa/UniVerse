import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_verse/src/features/forum/data/repository/feed_repo_impl.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class UpdateTweetParams{
  final String id;
  final String level;

  UpdateTweetParams(this.id, this.level);
}

class UpdateTweet extends UseCase<Tweet, UpdateTweetParams>{
  final FeedRepositoryImpl _repositoryImpl;

  UpdateTweet(this._repositoryImpl);

  @override
  Future<Either<Failure, Tweet>> call(UpdateTweetParams params)async{
   return await _repositoryImpl.updateTweet(id: params.id, level: params.level);
  }
}

final updateTweeCaseProvider = Provider((ref) {
  return UpdateTweet(ref.read(feedRepoProvider));
});