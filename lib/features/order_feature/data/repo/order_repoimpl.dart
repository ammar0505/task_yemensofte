
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_yemensofte/core/errors/failure.dart';
import 'package:task_yemensofte/features/order_feature/data/data_source/order_data_source.dart';
import 'package:task_yemensofte/features/order_feature/domain/entity/order_entity.dart';
import 'package:task_yemensofte/features/order_feature/domain/repo/order_repo.dart';

class OrderRepoimpl extends  OrderRepo  {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepoimpl({required this.orderRemoteDataSource});

  Future<Either<Failure, T>> postData<T>(
    Future<T> Function() postDataFunction,
  ) async {
    try {
      var dataPosted = await postDataFunction();
      return right(dataPosted);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrders(
      String userid, String lang, String P_BILL_SRL, String P_PRCSSD_FLG) async {
    return postData(
        () => orderRemoteDataSource.order(userid, lang, P_BILL_SRL, P_PRCSSD_FLG));
  }
}
