part of 'delivery_login_cubit_cubit.dart';

@immutable
abstract class DeliveryLoginCubitState {}

class DeliveryLoginCubitInitial extends DeliveryLoginCubitState {}

class DeliveryLoginCubitLoading extends DeliveryLoginCubitState {}

class DeliveryLoginCubitSuccess extends DeliveryLoginCubitState {
  final DeliveryLoginEntity deliveryLoginEntity;
  DeliveryLoginCubitSuccess({required this.deliveryLoginEntity});
}

class DeliveryLoginCubitFailure extends DeliveryLoginCubitState {
  final String errorMessage;
  DeliveryLoginCubitFailure({required this.errorMessage});
}
