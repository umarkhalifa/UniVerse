import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/authentication/data/data_source/data_source.dart';
import 'package:uni_verse/src/features/authentication/domain/repository/auth_repository.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthenticationDataSource _authenticationDataSource;

  AuthRepositoryImpl(this._authenticationDataSource);

  @override
  Future<Either<Failure, bool>> forgotPassword({required String email}) async {
    try {
      await _authenticationDataSource.forgotPassword(email: email);
      return const Right(true);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> registerWithEmail({required String email,
    required String password,
    required String name}) async {
    try {
      await _authenticationDataSource.registerWithEmail(
          email: email, password: password, name: name);
      return const Right(true);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }



  @override
  Future<Either<Failure, bool>> setBioData({required String userName,
    required String department,
    required String regNumber,
    required String level,
    required int color,required String gender,
  required String avatar}) async {
    try {
      await _authenticationDataSource.setBioData(
          userName: userName,
          department: department,
          regNumber: regNumber,
          level: level,
          color: color, gender: gender, avatar: avatar,);
      return const Right(true);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }



  @override
  Future<Either<Failure, bool>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _authenticationDataSource.signInWithEmail(
          email: email, password: password);
      return const Right(true);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> fetchAvatars(
      {required String gender}) async {
    try {
      final data = await _authenticationDataSource.fetchMaleAvatars(
          gender: gender);
      return Right(data);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Stream<User?> getUser(){
    return _authenticationDataSource.getUser();
  }
}


final authRepositoryProvider = Provider((ref) {
  final authenticationDataSource = ref.read(authDataSourceProvider);
  return AuthRepositoryImpl(authenticationDataSource);
});