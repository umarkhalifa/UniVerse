import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uni_verse/src/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class ForgotPasswordParams {
  final String email;

  ForgotPasswordParams(this.email);
}

class ForgotPasswordUseCase extends UseCase<bool, ForgotPasswordParams> {
  final AuthRepositoryImpl _authRepositoryImpl;

  ForgotPasswordUseCase(this._authRepositoryImpl);

  @override
  Future<Either<Failure, bool>> call(ForgotPasswordParams params) async {
    return await _authRepositoryImpl.forgotPassword(email: params.email);
  }
}

final forgotPasswordCaseProvider = Provider((ref) {
  final authImpl = ref.read(authRepositoryProvider);
  return ForgotPasswordUseCase(authImpl);
});