import 'package:dartz/dartz.dart';
import 'package:food/Features/order/data/models/carts_model.dart';

import '../../../../core/errors/failures.dart';

abstract class CartsRepo {
  Future<Either<Failure, CartsModel>> getCarts();

  Future<Either<Failure, CartsModel>> addCarts(productId);

  Future<Either<Failure, CartsModel>> deleteCarts(productId);

  Future<Either<Failure, CartsModel>> updateCarts(quantity);
}
