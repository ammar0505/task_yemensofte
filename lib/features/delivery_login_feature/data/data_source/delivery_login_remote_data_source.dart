
import 'package:task_yemensofte/core/api_service.dart';
import 'package:task_yemensofte/features/delivery_login_feature/data/model/delivery_login_model/delivery_login_model.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/entity/delivery_login_entity.dart';

abstract class DeliveryLoginRemoteDataSource {
  Future<DeliveryLoginEntity> signIn(String userid, String password,String lang);

}

class DeliveryLoginRemoteDataSourceImpl implements DeliveryLoginRemoteDataSource {
  final ApiService apiService;
  DeliveryLoginRemoteDataSourceImpl(this.apiService,);

  

  @override
  Future<DeliveryLoginEntity> signIn(String userid, String password,String lang) async {      
    var data = await apiService.post(
      endPoint: "OnyxDeliveryService/Service.svc/CheckDeliveryLogin",
      data: { "P_LANG_NO": lang,
        "P_DLVRY_NO": userid,
        "P_PSSWRD": password},
    );

    DeliveryLoginEntity userVerification = DeliveryLoginModel.fromJson(data);


    return userVerification;
  }
}
