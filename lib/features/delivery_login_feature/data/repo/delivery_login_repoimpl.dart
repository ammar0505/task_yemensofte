
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_yemensofte/core/errors/failure.dart';
import 'package:task_yemensofte/features/delivery_login_feature/data/data_source/delivery_login_remote_data_source.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/entity/delivery_login_entity.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/repo/delivery_login_repo.dart';

class     DeliveryLoginRepoimpl extends DeliveryLoginRepo {
  final DeliveryLoginRemoteDataSource deliveryLoginRemoteDataSource;

  DeliveryLoginRepoimpl({required this.deliveryLoginRemoteDataSource});

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
  Future<Either<Failure, DeliveryLoginEntity>> signIn(
   String userid, String password, String Language
  ) async {
    return postData(() => deliveryLoginRemoteDataSource.signIn( userid,  password,  Language));
  }


}
