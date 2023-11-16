import 'package:dartz/dartz.dart';
import 'package:uni_verse/src/features/home/domain/entities/course.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
import 'package:uni_verse/src/features/home/domain/entities/user.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';

abstract class HomeRepository{
  Future<Either<Failure,UserEntity>> getUserData();
  Future<Either<Failure,List<Course>>> getHomeCourse({required String level});
  Future<Either<Failure,List<Course>>> getCourses({required String level});
  Future<Either<Failure,List<Lecture>>> getCurrentLectures({required String level});
}