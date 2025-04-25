
import 'package:dartz/dartz.dart';
import 'package:task_yemensofte/core/errors/failure.dart';
import 'package:task_yemensofte/features/order_feature/domain/entity/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, OrderEntity>> getOrders();
}
