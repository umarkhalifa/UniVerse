import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/data/repository/home_repo_impl.dart';
import 'package:uni_verse/src/features/home/domain/entities/user.dart';
import 'package:uni_verse/src/features/home/domain/repository/home_repository.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class GetUserUseCase extends UseCase<UserEntity, void> {
  final HomeRepository _homeRepository;

  GetUserUseCase(this._homeRepository);

  @override
  Future<Either<Failure, UserEntity>> call(void params) async {
    return await _homeRepository.getUserData();
  }
}

final getUserCaseProvider = Provider((ref) {
  final repo = ref.read(homeRepoProvider);
  return GetUserUseCase(repo);
});