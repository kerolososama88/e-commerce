import '../../../data/models/carts_model.dart';

abstract class CartsState {}

class CartsInitial extends CartsState {}

class GetCartsLoading extends CartsState {}

class GetCartsFailure extends CartsState {
  final String errorMessage;

  GetCartsFailure(this.errorMessage);
}

class GetCartsSuccess extends CartsState {
  final CartsModel cartsModel;

  GetCartsSuccess(this.cartsModel);
}

class AddCartsLoading extends CartsState {}

class AddCartsFailure extends CartsState {
  final String errorMessage;

  AddCartsFailure(this.errorMessage);
}

class AddCartsSuccess extends CartsState {
  final CartsModel cartsModel;

  AddCartsSuccess(this.cartsModel);
}

class DeleteCartsLoading extends CartsState {}

class DeleteCartsFailure extends CartsState {
  final String errorMessage;

  DeleteCartsFailure(this.errorMessage);
}

class DeleteCartsSuccess extends CartsState {
  final CartsModel cartsModel;

  DeleteCartsSuccess(this.cartsModel);
}

class UpdateCartsLoading extends CartsState {}

class UpdateCartsFailure extends CartsState {
  final String errorMessage;

  UpdateCartsFailure(this.errorMessage);
}

class UpdateCartsSuccess extends CartsState {
  final CartsModel cartsModel;

  UpdateCartsSuccess(this.cartsModel);
}
