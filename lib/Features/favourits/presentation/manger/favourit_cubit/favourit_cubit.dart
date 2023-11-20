import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/favourits/data/models/favorite_model.dart';
import 'package:food/Features/favourits/data/repos/favorite_repo.dart';
import 'package:food/core/Utils/widgets/custom_show_toast.dart';
import '../../../../home/data/models/home_model.dart';
import 'favourit_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(
    super.initialState,
    this.favoriteRepo,
  );

  static FavoritesCubit get(context) => BlocProvider.of(context);

  final FavoriteRepo favoriteRepo;
  List<FavoritesData> listOfFavorites = [];
  Future<void> getFavorites() async {
    listOfFavorites.clear();
    emit(GetFavoritesLoading());
    var result = await favoriteRepo.getFavorite();
    result.fold((failure) {
      emit(GetFavoritesFailure(failure.errorMessage));
    }, (favoriteModel) {
      listOfFavorites.addAll(favoriteModel.data!.data ?? []);
      emit(GetFavoritesSuccess(favoriteModel));
    });
  }

  Future<void> addFavorites(Products productModel) async {
    emit(AddFavoritesLoading());
    var result = await favoriteRepo.addFavorite(productModel.id);
    result.fold((failure) {
      emit(AddFavoritesFailure(failure.errorMessage));
    }, (favoriteModel) {
      productModel.changeFavoriteItem();
      showToast(
        text: '${favoriteModel.message}',
        state: ToastState.SUCCESS,
      );
      getFavorites();
      emit(AddFavoritesSuccess(favoriteModel));
    });
  }

  Future<void> deleteFavorites(int productId) async {
    emit(DeleteFavoritesLoading());
    var result = await favoriteRepo.deleteFavorite(productId);
    result.fold((failure) {
      emit(DeleteFavoritesFailure(failure.errorMessage));
    }, (favoriteModel) {
      emit(DeleteFavoritesSuccess(favoriteModel));
    });
  }
}
