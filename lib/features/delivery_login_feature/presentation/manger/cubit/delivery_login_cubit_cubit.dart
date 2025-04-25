import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:task_yemensofte/core/errors/failure.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/entity/delivery_login_entity.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/usecase/delivery_login_usecase.dart';

part 'delivery_login_cubit_state.dart';

class DeliveryLoginCubit extends Cubit<DeliveryLoginCubitState> {
  final DeliveryLoginUsecase deliveryLoginUseCase;

  DeliveryLoginCubit(this.deliveryLoginUseCase)
      : super(DeliveryLoginCubitInitial());


  Future<void> signIn(String userid, String password, String lang) async {
    emit(DeliveryLoginCubitLoading());

    try {
      var params = DeliveryLoginParams(userid, password, lang);
      final result = await deliveryLoginUseCase.execute(params);

      result.fold(
        
        (failure) =>
            emit(DeliveryLoginCubitFailure(errorMessage: failure.message)),
        (userData) {
          if (userData.name != null) {
            emit(DeliveryLoginCubitSuccess(deliveryLoginEntity: userData));
          } else {
            emit(DeliveryLoginCubitFailure(
                errorMessage: userData.massge.toString()));
          }
        },
      );
    } catch (e) {
      if (e is DioException) {
        ServerFailure failure = ServerFailure.fromDioError(e);
        emit(DeliveryLoginCubitFailure(errorMessage: failure.message));
      } else {
        emit(DeliveryLoginCubitFailure(errorMessage: e.toString()));
      }
    }
  }
}
