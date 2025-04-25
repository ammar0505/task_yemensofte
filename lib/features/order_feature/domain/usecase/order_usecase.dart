import 'package:dartz/dartz.dart';
import 'package:task_yemensofte/core/errors/failure.dart';
import 'package:task_yemensofte/core/use_cases/param_use_case.dart';
import 'package:task_yemensofte/features/order_feature/domain/entity/order_entity.dart';
import 'package:task_yemensofte/features/order_feature/domain/repo/order_repo.dart';

class OrderUsecase extends UseCaseWithParam<OrderEntity, OrderParams> {
  final OrderRepo orderRepo;

  OrderUsecase(this.orderRepo);

  @override
  Future<Either<Failure, OrderEntity>> execute(OrderParams params) {
    return orderRepo.getOrders(params.userid, params.lang, params.P_BILL_SRL, params.P_PRCSSD_FLG);
  }
}

class OrderParams {
  final String userid;
  final String lang;
  final String P_BILL_SRL;
  final String P_PRCSSD_FLG;

  OrderParams(this.userid, this.P_BILL_SRL, this.lang, this.P_PRCSSD_FLG);
}
