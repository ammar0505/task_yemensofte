import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_yemensofte/core/database/database_helper.dart';
import 'package:task_yemensofte/features/order_feature/domain/entity/order_entity.dart';
import 'package:task_yemensofte/features/order_feature/domain/usecase/order_usecase.dart';

part 'order_cubit_state.dart';

class OrderCubitCubit extends Cubit<OrderCubitState> {
  final OrderUsecase orderUsecase;
  final DatabaseHelper dbHelper = DatabaseHelper();

  OrderCubitCubit(this.orderUsecase) : super(OrderCubitInitial());

  Future<void> getOrders(
      String userId, String lang, String pBillSrl, String pPrcssdFlg) async {
    emit(OrderCubitLoading());

    try {
      final localOrders = await dbHelper.getOrders(pPrcssdFlg);
      if (localOrders.isNotEmpty) {
        emit(OrderCubitSucsses(OrderEntity(
          id: localOrders.first.billSrl,
          total: localOrders.first.billAmt,
          date: localOrders.first.billDate,
          deliveryBills: localOrders,
        )));
        return;
      }

      final result = await orderUsecase
          .execute(OrderParams(userId, lang, pBillSrl, pPrcssdFlg));
      result.fold((failure) {
        emit(OrderCubitError(failure.message));
      }, (order) async {
        // Save to local database
        if (order.deliveryBills != null) {
          for (var bill in order.deliveryBills!) {
            await dbHelper.insertOrder(bill, pPrcssdFlg);
          }
        }
        emit(OrderCubitSucsses(order));
      });
    } catch (e) {
      emit(OrderCubitError(e.toString()));
    }
  }
}
