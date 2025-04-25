
import 'package:dartz/dartz.dart';
import 'package:task_yemensofte/core/errors/failure.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/entity/delivery_login_entity.dart';

abstract class DeliveryLoginRepo {
  Future<Either<Failure, DeliveryLoginEntity>> signIn(String userid, String password,String Language);

 
}