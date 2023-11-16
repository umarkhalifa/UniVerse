import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/data/repository/home_repo_impl.dart';
import 'package:uni_verse/src/features/home/domain/entities/course.dart';
import 'package:uni_verse/src/features/home/domain/repository/home_repository.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class GetHomeCourseUseCase extends UseCase<List<Course>, String> {
  final HomeRepository _homeRepository;

  GetHomeCourseUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<Course>>> call(String params) async {
    return await _homeRepository.getHomeCourse(level: params);
  }
}

final getHomeCaseProvider = Provider((ref) {
  final repo = ref.read(homeRepoProvider);
  return GetHomeCourseUseCase(repo);
});