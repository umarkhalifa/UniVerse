import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
import 'package:uni_verse/src/features/schedule/data/repository/schedule_repo_impl.dart';
import 'package:uni_verse/src/features/schedule/domain/repository/schedule_repository.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';
import 'package:uni_verse/src/utils/global_use_case.dart';

class ScheduleUseCase extends UseCase<List<Lecture>, String> {
  final ScheduleRepository _repository;
  ScheduleUseCase(this._repository);
  @override
  Future<Either<Failure, List<Lecture>>> call(String params) async {
    return await _repository.getSchedule(level: params);
  }
}

final scheduleUseCase = Provider(
  (ref) {
    final repo = ref.read(scheduleRepoProvider);
    return ScheduleUseCase(repo);
  },
);
