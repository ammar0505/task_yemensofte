import 'delivery_bill.dart';

class Data {
  List<DeliveryBill>? deliveryBills;

  Data({this.deliveryBills});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        deliveryBills: (json['DeliveryBills'] as List<dynamic>?)
            ?.map((e) => DeliveryBill.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'DeliveryBills': deliveryBills?.map((e) => e.toJson()).toList(),
      };
}
