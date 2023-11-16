import 'package:dartz/dartz.dart';
import 'package:uni_verse/src/utils/errors/failure.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
abstract class UseCaseStream<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
