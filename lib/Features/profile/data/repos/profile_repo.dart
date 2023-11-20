import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/login_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, LoginModel>> fetchProfile();

}