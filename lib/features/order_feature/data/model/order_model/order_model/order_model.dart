import 'package:task_yemensofte/features/order_feature/domain/entity/order_entity.dart';

import 'data.dart';
import 'result.dart';

class OrderModel extends OrderEntity {
  Data? data;
  Result? result;

  OrderModel({this.data, this.result})
      : super(
            id: data?.deliveryBills?.first.billSrl,
            total: data?.deliveryBills?.first.billAmt,
            date: data?.deliveryBills?.first.billDate,
            deliveryBills: data?.deliveryBills);

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: json['Data'] == null
            ? null
            : Data.fromJson(json['Data'] as Map<String, dynamic>),
        result: json['Result'] == null
            ? null
            : Result.fromJson(json['Result'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Data': data?.toJson(),
        'Result': result?.toJson(),
      };
}
