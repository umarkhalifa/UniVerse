import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/forum/domain/entity/like_post.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

import '../../data/repository/feed_repo_impl.dart';

class FetchLikes extends UseCase<List<LikePost>, void> {
  final FeedRepositoryImpl _repositoryImpl;

  FetchLikes(this._repositoryImpl);

  @override
  Future<Either<Failure, List<LikePost>>> call(void params) async {
    return await _repositoryImpl.fetchLikes();
  }
}

final fetchLikesCaseProvider = Provider(
  (ref) {
    final repo = ref.read(feedRepoProvider);
    return FetchLikes(repo);
  },
);
