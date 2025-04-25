import 'package:dartz/dartz.dart';
import 'package:task_yemensofte/core/errors/failure.dart';

abstract class UseCaseWithParam<type, params> {
  Future<Either<Failure, type>> execute(params params);
}
