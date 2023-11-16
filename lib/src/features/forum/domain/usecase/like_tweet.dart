import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

import '../../data/repository/feed_repo_impl.dart';
class LikeParams{
  final String id;
  final String level;

  LikeParams(this.id, this.level);
}
class LikeTweet extends UseCase<String, LikeParams> {
  final FeedRepositoryImpl _repositoryImpl;

  LikeTweet(this._repositoryImpl);

  @override
  Future<Either<Failure, String>> call(LikeParams params) async {
    return await _repositoryImpl.likeTweet(postId: params.id,level: params.level);
  }
}

final likeTweetCaseProvider = Provider(
  (ref) {
    final repo = ref.read(feedRepoProvider);
    return LikeTweet(repo);
  },
);
