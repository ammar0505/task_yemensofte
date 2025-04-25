import 'package:task_yemensofte/features/order_feature/data/model/order_model/order_model/delivery_bill.dart';

class OrderEntity {
  final String? id;
  final String? total;
  final String? date;
  final List<DeliveryBill>? deliveryBills;

  OrderEntity({
    required this.id,
    required this.total,
    required this.date,
    this.deliveryBills,
  });
}
