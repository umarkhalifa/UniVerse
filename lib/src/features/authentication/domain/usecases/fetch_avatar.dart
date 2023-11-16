import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class FetchAvatarUseCase extends UseCase<List<String>, String> {
  final AuthRepositoryImpl _authRepositoryImpl;

  FetchAvatarUseCase(this._authRepositoryImpl);

  @override
  Future<Either<Failure, List<String>>> call(String params) async {
    return await _authRepositoryImpl.fetchAvatars(gender: params);
  }
}

final fetchAvatarCaseProvider = Provider((ref) {
  final authImpl = ref.read(authRepositoryProvider);
  return FetchAvatarUseCase(authImpl);
});
