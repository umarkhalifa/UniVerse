import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

import '../../data/repository/feed_repo_impl.dart';
class UnlikeParams{
  final String postId;
  final String level;
  final String id;

  UnlikeParams( this.postId,this.level, this.id,);
}
class UnLikeTweet extends UseCase<bool, UnlikeParams> {
  final FeedRepositoryImpl _repositoryImpl;

  UnLikeTweet(this._repositoryImpl);

  @override
  Future<Either<Failure, bool>> call(UnlikeParams params) async {
    return await _repositoryImpl.deleteLike(postId: params.postId,level: params.level,id: params.id);
  }
}

final dislikeTweetCaseProvider = Provider(
      (ref) {
    final repo = ref.read(feedRepoProvider);
    return UnLikeTweet(repo);
  },
);
