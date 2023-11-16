import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/data/repository/home_repo_impl.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
import 'package:uni_verse/src/features/home/domain/repository/home_repository.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class GetCurrentLectureUseCase extends UseCase<List<Lecture>, String> {
  final HomeRepository _homeRepository;

  GetCurrentLectureUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<Lecture>>> call(String params) async {
    return await _homeRepository.getCurrentLectures(level: params);
  }
}

final getLectureCaseProvider = Provider((ref) {
  final repo = ref.read(homeRepoProvider);
  return GetCurrentLectureUseCase(repo);
});