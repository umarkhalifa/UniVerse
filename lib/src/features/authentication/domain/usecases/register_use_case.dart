import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_verse/src/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class RegisterParams {
  final String email;
  final String password;
  final String name;

  RegisterParams(this.email, this.password, this.name);
}

class RegisterUseCase extends UseCase<bool, RegisterParams> {
  final AuthRepositoryImpl _authRepositoryImpl;

  RegisterUseCase(this._authRepositoryImpl);

  @override
  Future<Either<Failure, bool>> call(RegisterParams params) async {
    return await _authRepositoryImpl.registerWithEmail(
        email: params.email, password: params.password, name: params.name);
  }
}

final registerCaseProvider = Provider((ref) {
  final authImpl = ref.read(authRepositoryProvider);
  return RegisterUseCase(authImpl);
});
