import 'package:flutter/material.dart';
import 'package:task_yemensofte/core/style/app_color.dart';
import 'package:task_yemensofte/features/order_feature/presentation/widget/appear_widget.dart';
import 'package:task_yemensofte/features/order_feature/presentation/widget/order_card_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.secondaryColor,
        body: Column(
          children: [
            const AppearWidget(),
            const SizedBox(height: 12),
            Container(
              width: 300,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black87,
                indicator: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'New'),
                  Tab(text: 'Others'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return OrderCardWidget(
                        orderId: '1234567890',
                        status: 'new',
                        totalPrice: '100',
                        date: '2021-01-01',
                        orderType: true,
                      );
                    },
                  ),
                   ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return OrderCardWidget(
                        orderId: '1234567890',
                        status: 'Delivering',
                        totalPrice: '100',
                        date: '2021-01-01',
                        orderType: true,
                      );
                    },
                  ),

                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Center(
                  //         child: Image.asset(
                  //       "images/png/ic_emptyorder@2x.png",
                  //       width: 224,
                  //       height: 180,
                  //     )),
                  //     Text(
                  //       "No orders yet",
                  //       style: TextStyle(
                  //           color: AppColor.textColor,
                  //           fontSize: 24,
                  //           fontWeight: FontWeight.w600),
                  //     ),
                  //     Text(
                  //       "You don't have any orders in your history.",
                  //       style: TextStyle(
                  //           color: AppColor.textColor,
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.w400),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
