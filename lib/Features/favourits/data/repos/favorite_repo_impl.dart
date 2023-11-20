import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/Features/favourits/data/models/favorite_model.dart';
import '../../../../core/Utils/function/api_servic.dart';
import '../../../../core/errors/failures.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final ApiService apiService;

  FavoriteRepoImpl(this.apiService);

  @override
  Future<Either<Failure, FavoriteModel>> getFavorite() async {
    try {
      Response data = await apiService.get(
        endPoint: 'favorites',
        lang: 'en',
      );
      return right(FavoriteModel.fromJson(data.data));
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> addFavorite(productId) async {
    try {
      Response data = await apiService.post(
        endPoint: 'favorites',
        lang: 'en',
        data: {
          "product_id":productId,
        },
      );
      print("favoriteModel: ${data.data}");
      return right(FavoriteModel.fromJson(data.data));
      // return right(data.data['message']);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> deleteFavorite(productId) async {
    try {
      Response data = await apiService.delete(
        endPoint: 'favorites/1',
        lang: 'en',
        data: {
          "product_id":productId,
        },
      );
      print("favoriteModel: ${data.data}");
      return right(FavoriteModel.fromJson(data.data));
      // return right(data.data['message']);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
