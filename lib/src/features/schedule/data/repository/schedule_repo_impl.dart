import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
import 'package:uni_verse/src/features/schedule/data/data_source/schedule_data_source.dart';
import 'package:uni_verse/src/features/schedule/domain/repository/schedule_repository.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleDataSource _dataSource;

  ScheduleRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<Lecture>>> getSchedule(
      {required String level}) async {
    try {
      final value = await _dataSource.getCurrentLectures(level: level);
      return Right(value);
    } catch (e) {
      return Left(
        Failure(
          e.toString(),
        ),
      );
    }
  }
}

final scheduleRepoProvider = Provider(
  (ref) {
    final repo = ref.read(scheduleDataProvider);
    return ScheduleRepositoryImpl(repo);
  },
);
