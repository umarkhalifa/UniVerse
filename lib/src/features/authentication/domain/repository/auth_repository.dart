import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> signInWithEmail(
      {required String email, required String password});

  Future<Either<Failure, bool>> registerWithEmail(
      {required String email, required String password, required String name});

  Future<Either<Failure, bool>> forgotPassword({required String email});

  Future<Either<Failure, bool>> setBioData(
      {required String userName,
      required String department,
      required String regNumber,
      required String level,
      required int color,
      required String gender,
      required String avatar});

  Future<Either<Failure, List<String>>> fetchAvatars({required String gender});


  Stream<User?> getUser();

}
