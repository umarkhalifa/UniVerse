import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class SignInParams {
  final String email;
  final String password;

  SignInParams(this.email, this.password);
}

class SignInUseCase extends UseCase<bool, SignInParams> {
  final AuthRepositoryImpl _authRepositoryImpl;

  SignInUseCase(this._authRepositoryImpl);

  @override
  Future<Either<Failure, bool>> call(SignInParams params) async {
    return await _authRepositoryImpl.signInWithEmail(
        email: params.email, password: params.password);
  }
}

final signInCaseProvider = Provider((ref) {
  final authImpl = ref.read(authRepositoryProvider);
  return SignInUseCase(authImpl);
});
