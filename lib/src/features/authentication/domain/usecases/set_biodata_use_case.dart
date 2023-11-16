import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class SetBioDataParams {
  final String userName;
  final String department;
  final String regNumber;
  final String level;
  final int color;
  final String gender;
  final String avatar;

  SetBioDataParams(
      this.userName, this.department, this.regNumber, this.level, this.color, this.gender, this.avatar);
}

class SetBioDataUseCase extends UseCase<bool, SetBioDataParams> {
  final AuthRepositoryImpl _authRepositoryImpl;

  SetBioDataUseCase(this._authRepositoryImpl);

  @override
  Future<Either<Failure, bool>> call(SetBioDataParams params) async {
    return await _authRepositoryImpl.setBioData(
      userName: params.userName,
      department: params.department,
      regNumber: params.regNumber,
      level: params.level,
      color: params.color, gender: params.gender, avatar: params.avatar,
    );
  }
}

final setBioDataCaseProvider = Provider((ref) {
  final authImpl = ref.read(authRepositoryProvider);
  return SetBioDataUseCase(authImpl);
});