import 'package:dartz/dartz.dart';
import 'package:food/Features/favourits/data/models/favorite_model.dart';
import '../../../../core/errors/failures.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, FavoriteModel>> getFavorite();

  Future<Either<Failure, FavoriteModel>> addFavorite(productId);

  Future<Either<Failure, FavoriteModel>> deleteFavorite(productId);
}
