import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/Utils/widgets/custom_show_toast.dart';

import '../../../data/repos/carts_repo.dart';
import 'carts_state.dart';

class CartsCubit extends Cubit<CartsState> {
  CartsCubit(
    super.initialState,
    this.cartsRepo,
  );

  static CartsCubit get(context) => BlocProvider.of(context);

  final CartsRepo cartsRepo;


  Future<void> getCarts() async {
    emit(GetCartsLoading());
    var result = await cartsRepo.getCarts();
    result.fold((failure) {
      emit(GetCartsFailure(failure.errorMessage));
    }, (cartsModel) {
      emit(GetCartsSuccess(cartsModel));
    });
  }

  Future<void> addCarts(int productId) async {
    emit(AddCartsLoading());
    var result = await cartsRepo.addCarts(productId);
    result.fold((failure) {
      emit(AddCartsFailure(failure.errorMessage));
    }, (cartsModel) {
      getCarts();
      showToast(
        text: '${cartsModel.message}',
        state: ToastState.SUCCESS,
      );
      emit(AddCartsSuccess(cartsModel));
    });
  }

  Future<void> deleteCarts(int productId) async {
    emit(DeleteCartsLoading());
    var result = await cartsRepo.deleteCarts(productId);
    result.fold((failure) {
      emit(DeleteCartsFailure(failure.errorMessage));
    }, (cartsModel) {
      emit(DeleteCartsSuccess(cartsModel));
      showToast(
        text: '${cartsModel.message}',
        state: ToastState.SUCCESS,
      );
      print(cartsModel.message);
    });
  }

  Future<void> updateCarts(quantity) async {
    emit(AddCartsLoading());
    var result = await cartsRepo.updateCarts(quantity);
    result.fold((failure) {
      emit(UpdateCartsFailure(failure.errorMessage));
    }, (cartsModel) {
      showToast(
        text: '${cartsModel.message}',
        state: ToastState.SUCCESS,
      );
      emit(UpdateCartsSuccess(cartsModel));
    });
  }
}
