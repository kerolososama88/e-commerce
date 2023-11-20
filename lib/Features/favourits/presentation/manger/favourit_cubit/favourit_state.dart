import 'package:food/Features/favourits/data/models/favorite_model.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class GetFavoritesInitial extends FavoritesState {}

class GetFavoritesLoading extends FavoritesState {}

class GetFavoritesFailure extends FavoritesState {
  final String errorMessage;

  GetFavoritesFailure(this.errorMessage);
}

class GetFavoritesSuccess extends FavoritesState {
  final FavoriteModel favoriteModel;

  GetFavoritesSuccess(this.favoriteModel);
}

class AddFavoritesLoading extends FavoritesState {}

class AddFavoritesFailure extends FavoritesState {
  final String errorMessage;

  AddFavoritesFailure(this.errorMessage);
}

class AddFavoritesSuccess extends FavoritesState {
  final FavoriteModel favoriteModel;

  AddFavoritesSuccess(this.favoriteModel);
}

class DeleteFavoritesLoading extends FavoritesState {}

class DeleteFavoritesFailure extends FavoritesState {
  final String errorMessage;

  DeleteFavoritesFailure(this.errorMessage);
}

class DeleteFavoritesSuccess extends FavoritesState {
  final FavoriteModel favoriteModel;

  DeleteFavoritesSuccess(this.favoriteModel);
}