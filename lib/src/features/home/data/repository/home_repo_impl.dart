import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/data/data_source/data_source.dart';
import 'package:uni_verse/src/features/home/domain/entities/course.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
import 'package:uni_verse/src/features/home/domain/entities/user.dart';
import 'package:uni_verse/src/features/home/domain/repository/home_repository.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Lecture>>> getCurrentLectures(
      {required String level}) async {
    try {
      final value = await _dataSource.getCurrentLectures(level: level);
      final items =  value.where((element) {
        return int.parse(element.endTime!.substring(0, 2)) >
            DateTime.now().hour;
      }).toList();
      items.sort(
            (a, b) => int.parse(a.startTime!.length == 7 ? a.startTime![0]:a.startTime!.substring(0, 2)).compareTo(
          int.parse(
            b.startTime!.length == 7 ? b.startTime![0]:b.startTime!.substring(0, 2),
          ),
        ),
      );
      return Right(items);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getHomeCourse(
      {required String level}) async {
    try {
      final value = await _dataSource.getHomeCourses(level: level);
      return Right(value);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      final value = await _dataSource.getUser();
      return Right(value);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getCourses({required String level})async{
    try {
      final value = await _dataSource.courses(level: level);
      return Right(value);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

final homeRepoProvider = Provider((ref) {
  final repo = ref.read(homeDataProvider);
  return HomeRepositoryImpl(repo);
});
