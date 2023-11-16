import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/forum/data/repository/feed_repo_impl.dart';
import 'package:uni_verse/src/features/forum/domain/entity/tweet.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class FetchCommentParams {
  final String level;
  final String id;

  FetchCommentParams(this.level, this.id, );
}

class FetchCommentUseCase extends UseCaseStream<List<Tweet>, FetchCommentParams> {
  final FeedRepositoryImpl _repositoryImpl;

  FetchCommentUseCase(this._repositoryImpl);

  @override
  Stream<Either<Failure, List<Tweet>>> call(FetchCommentParams params)async*{
    yield* _repositoryImpl.fetchComments(level: params.level, id: params.id);
  }


}

final fetchCommentCaseProvider = Provider((ref) {
  return FetchCommentUseCase(ref.read(feedRepoProvider));
});

