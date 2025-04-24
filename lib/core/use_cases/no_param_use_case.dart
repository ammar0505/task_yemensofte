import 'package:dartz/dartz.dart';
import 'package:task_yemensofte/core/errors/failure.dart';

abstract class UseCaseWithNoParam<type> {
  Future<Either<Failure, type>> execute();
}
