import 'package:task_yemensofte/core/api_service.dart';
import 'package:task_yemensofte/features/delivery_login_feature/data/model/delivery_login_model/delivery_login_model.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/entity/delivery_login_entity.dart';

abstract class DeliveryLoginRemoteDataSource {
  Future<DeliveryLoginEntity> login(
      String userId, String password, String lang);
}

class DeliveryLoginRemoteDataSourceImpl
    implements DeliveryLoginRemoteDataSource {
  final ApiService apiService;

  DeliveryLoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<DeliveryLoginEntity> login(
      String userId, String password, String lang) async {
    try {
      final response = await apiService.post(
        endPoint: 'Service.svc/CheckDeliveryLogin',
        data: {
          "Value": {
        "P_LANG_NO": "2",
        "P_DLVRY_NO": userId,
        "P_PSSWRD": password
    }
        },
      );

      return DeliveryLoginModel.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
