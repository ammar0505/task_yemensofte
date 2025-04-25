import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_yemensofte/core/provider/order_state.dart';
import 'package:task_yemensofte/core/setup_service_locator.dart';
import 'package:task_yemensofte/core/style/app_color.dart';
import 'package:task_yemensofte/core/widgets/inactivity_wrapper.dart';
import 'package:task_yemensofte/features/delivery_login_feature/data/repo/delivery_login_repoimpl.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/usecase/delivery_login_usecase.dart';
import 'package:task_yemensofte/features/delivery_login_feature/presentation/manger/cubit/delivery_login_cubit_cubit.dart';
import 'package:task_yemensofte/features/order_feature/data/repo/order_repoimpl.dart';
import 'package:task_yemensofte/features/order_feature/domain/usecase/order_usecase.dart';
import 'package:task_yemensofte/features/order_feature/presentation/manger/cubit/order_cubit_cubit.dart';
import 'package:task_yemensofte/features/splash_screen_feature/presentation/screen/splash_screen.dart';

void main() {
  setupServiceLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderStatusProvider()),
        BlocProvider(
          create: (context) => DeliveryLoginCubit(
            DeliveryLoginUsecase(getit.get<DeliveryLoginRepoimpl>()),
          ),
        ),
        BlocProvider(
          create: (context) => OrderCubitCubit(
            OrderUsecase(getit.get<OrderRepoimpl>()),
          ),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orders Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.secondaryColor,
        ),
        useMaterial3: true,
      ),
      home: InactivityWrapper(
        child: const SplashScreen(),
      ),
    );
  }
}
