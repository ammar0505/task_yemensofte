

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_yemensofte/core/api_service.dart';
import 'package:task_yemensofte/features/delivery_login_feature/data/data_source/delivery_login_remote_data_source.dart';
import 'package:task_yemensofte/features/delivery_login_feature/data/repo/delivery_login_repoimpl.dart';
import 'package:task_yemensofte/features/delivery_login_feature/domain/repo/delivery_login_repo.dart';
import 'package:task_yemensofte/features/order_feature/data/data_source/order_data_source.dart';
import 'package:task_yemensofte/features/order_feature/data/repo/order_repoimpl.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<ApiService>(ApiService(Dio()));

  getit.registerSingleton<DeliveryLoginRepoimpl>(DeliveryLoginRepoimpl(
    deliveryLoginRemoteDataSource: 
          DeliveryLoginRemoteDataSourceImpl(getit.get<ApiService>())
  )
    
  );
  getit.registerSingleton<OrderRepoimpl>(OrderRepoimpl(
    orderRemoteDataSource: 
          OrderRemoteDataSourceImpl(getit.get<ApiService>())
  )
    
  );

}
