import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/home_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeModel>> fetchCategoryItems();

}
