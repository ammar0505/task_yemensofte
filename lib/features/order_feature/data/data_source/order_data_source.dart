import 'package:task_yemensofte/core/api_service.dart';
import 'package:task_yemensofte/features/delivery_login_feature/data/model/delivery_login_model/delivery_login_model.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/entity/delivery_login_entity.dart';
import 'package:task_yemensofte/features/order_feature/data/model/order_model/order_model/order_model.dart';
import 'package:task_yemensofte/features/order_feature/domain/entity/order_entity.dart';

abstract class OrderRemoteDataSource {
  Future<OrderEntity> order(
      String userId, String lang, String P_BILL_SRL, String P_PRCSSD_FLG);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiService apiService;

  OrderRemoteDataSourceImpl(this.apiService);

  @override
  Future<OrderEntity> order(
      String userId, String lang, String P_BILL_SRL, String P_PRCSSD_FLG) async {
    try {
      final response = await apiService.post(
        endPoint: 'Service.svc/GetDeliveryBillsItems',
        data: {
           "Value": {
            "P_DLVRY_NO": userId,
            "P_LANG_NO": lang,
            "P_BILL_SRL": P_BILL_SRL,
            "P_PRCSSD_FLG": P_PRCSSD_FLG
          }
        },
      );

      return OrderModel.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
