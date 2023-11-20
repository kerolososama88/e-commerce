import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/Features/order/data/repos/carts_repo.dart';
import '../../../../core/Utils/function/api_servic.dart';
import '../../../../core/errors/failures.dart';
import '../models/carts_model.dart';

class CartsRepoImpl implements CartsRepo {
  final ApiService apiService;

  CartsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CartsModel>> getCarts() async {
    try {
      Response data = await apiService.get(
        endPoint: 'carts',
        lang: 'en',
      );
      return right(CartsModel.fromJson(data.data));
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartsModel>> addCarts(productId) async {
    try {
      Response data = await apiService.post(
        endPoint: 'carts',
        lang: 'en',
        data: {
          'product_id':productId,
        },
      );
      return right(data.data['message']);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartsModel>> deleteCarts(productId) async {
    try {
      Response data = await apiService.delete(
        endPoint: 'carts/2',
        lang: 'en',
        data: {
          'product_id':productId,
        },
      );
      return right(data.data['message']);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartsModel>> updateCarts(quantity) async {
    try {
      Response data = await apiService.put(
        endPoint: 'carts/3',
        lang: 'en',
        data: {
          'quantity':quantity,
        },
      );
      return right(data.data['message']);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
