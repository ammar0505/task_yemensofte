import 'package:flutter/material.dart';
import 'package:task_yemensofte/core/style/app_color.dart';

class OrderStatusProvider with ChangeNotifier {
  Color getStatusColor(String status) {
    switch (status) {
      case 'FULL_RETURN ':
        return AppColor.primaryColor;
      case 'PARTIAL_RETURN':
        return AppColor.redColor;
      case 'Delivered':
        return AppColor.lightGrayColor;
      default:
        return AppColor.darkGreenColor;
    }
  }
}
