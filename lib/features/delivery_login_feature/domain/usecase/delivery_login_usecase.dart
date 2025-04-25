
import 'package:dartz/dartz.dart';
import 'package:task_yemensofte/core/errors/failure.dart';
import 'package:task_yemensofte/core/use_cases/param_use_case.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/entity/delivery_login_entity.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/repo/delivery_login_repo.dart';

class DeliveryLoginUsecase extends UseCaseWithParam<DeliveryLoginEntity, DeliveryLoginParams> {
  final DeliveryLoginRepo deliveryLoginRepo;

  DeliveryLoginUsecase(this.deliveryLoginRepo);

  @override
  Future<Either<Failure, DeliveryLoginEntity>> execute(DeliveryLoginParams params) {
    return deliveryLoginRepo.signIn(params.userid, params.password, params.lang);
  }
}

class DeliveryLoginParams {
  final String userid;
  final String password;
  final String lang;

  DeliveryLoginParams(this.userid, this.password, this.lang);
}
