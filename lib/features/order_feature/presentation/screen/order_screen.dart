import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_yemensofte/core/style/app_color.dart';
import 'package:task_yemensofte/features/order_feature/presentation/manger/cubit/order_cubit_cubit.dart';
import 'package:task_yemensofte/features/order_feature/presentation/widget/appear_widget.dart';
import 'package:task_yemensofte/features/order_feature/presentation/widget/order_card_widget.dart';

class OrdersScreen extends StatefulWidget {
  final String name;
  const OrdersScreen({super.key, required this.name});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);

    // Load initial data
    _fetchOrders(isNewOrders: true);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      _fetchOrders(isNewOrders: _tabController.index == 0);
    }
  }

  void _fetchOrders({required bool isNewOrders}) {
    context.read<OrderCubitCubit>().getOrders(
          "1010",
          '1', // lang
          '', // P_BILL_SRL
          isNewOrders ? '0' : '1', // P_PRCSSD_FLG
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Column(
        children: [
          AppearWidget(name: widget.name),
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
              controller: _tabController,
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
              controller: _tabController,
              children: [
                // New Orders Tab
                BlocBuilder<OrderCubitCubit, OrderCubitState>(
                  builder: (context, state) {
                    if (state is OrderCubitLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is OrderCubitError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.message,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => _fetchOrders(isNewOrders: true),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    } else if (state is OrderCubitSucsses) {
                      if (state.order.deliveryBills == null ||
                          state.order.deliveryBills!.isEmpty) {
                        return const Center(
                          child: Text(
                            'No new orders available',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async => _fetchOrders(isNewOrders: true),
                        child: ListView.builder(
                          itemCount: state.order.deliveryBills!.length,
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context, index) {
                            final order = state.order.deliveryBills![index];
                            return OrderCardWidget(
                              orderId: order.billSrl ?? '',
                              status: 'New',
                              totalPrice: order.billAmt ?? '0',
                              date: order.billDate ?? '',
                              orderType: true,
                            );
                          },
                        ),
                      );
                    }
                    return const Center(
                      child: Text(
                        'Pull to refresh',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
                // Others Orders Tab
                BlocBuilder<OrderCubitCubit, OrderCubitState>(
                  builder: (context, state) {
                    if (state is OrderCubitLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is OrderCubitError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.message,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => _fetchOrders(isNewOrders: false),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    } else if (state is OrderCubitSucsses) {
                      if (state.order.deliveryBills == null ||
                          state.order.deliveryBills!.isEmpty) {
                        return const Center(
                          child: Text(
                            'No other orders available',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async => _fetchOrders(isNewOrders: false),
                        child: ListView.builder(
                          itemCount: state.order.deliveryBills!.length,
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context, index) {
                            final order = state.order.deliveryBills![index];
                            return OrderCardWidget(
                              orderId: order.billSrl ?? '',
                              status: 'Others',
                              totalPrice: order.billAmt ?? '0',
                              date: order.billDate ?? '',
                              orderType: true,
                            );
                          },
                        ),
                      );
                    }
                    return const Center(
                      child: Text(
                        'Pull to refresh',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
