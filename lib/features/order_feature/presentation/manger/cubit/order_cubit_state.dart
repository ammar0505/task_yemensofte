part of 'order_cubit_cubit.dart';

@immutable
sealed class OrderCubitState {}

final class OrderCubitInitial extends OrderCubitState {}

final class OrderCubitLoading extends OrderCubitState {}
final class OrderCubitSucsses extends OrderCubitState {
  final OrderEntity order;
  OrderCubitSucsses(this.order);
}
final class OrderCubitError extends OrderCubitState {
  final String message;
  OrderCubitError(this.message);
}
