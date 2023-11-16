import 'package:dartz/dartz.dart';
import 'package:uni_verse/src/features/home/domain/entities/lecture.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';

abstract class ScheduleRepository{
  Future<Either<Failure, List<Lecture>>> getSchedule({required String level});
}