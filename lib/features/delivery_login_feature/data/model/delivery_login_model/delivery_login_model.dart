import 'package:task_yemensofte/features/delivery_login_feature/domain/entity/delivery_login_entity.dart';

import 'data.dart';
import 'result.dart';

class DeliveryLoginModel extends DeliveryLoginEntity {
  Data? data;
  Result? result;

  DeliveryLoginModel({this.data, this.result})
      : super(name: data?.deliveryName, massge: result?.errMsg);

  factory DeliveryLoginModel.fromJson(Map<String, dynamic> json) {
    return DeliveryLoginModel(
      data: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
      result: json['Result'] == null
          ? null
          : Result.fromJson(json['Result'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'Data': data?.toJson(),
        'Result': result?.toJson(),
      };
}
