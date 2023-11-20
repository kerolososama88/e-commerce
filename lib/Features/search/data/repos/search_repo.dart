import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/search_model.dart';

abstract class SearchRepo {

  Future<Either<Failure, SearchModel>> fetchSearch({required text});
}
