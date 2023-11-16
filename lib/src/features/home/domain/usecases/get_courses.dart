import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/data/repository/home_repo_impl.dart';
import 'package:uni_verse/src/features/home/domain/entities/course.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class GetCourses extends UseCase<List<Course>, String> {
  final HomeRepositoryImpl _homeRepositoryImpl;

  GetCourses(this._homeRepositoryImpl);

  @override
  Future<Either<Failure, List<Course>>> call(String params) async {
    return await _homeRepositoryImpl.getCourses(level: params);
  }
}

final homeCoursesUseCaseProvider = Provider(
  (ref) {
    final repo = ref.read(homeRepoProvider);
    return GetCourses(repo);
  },
);
