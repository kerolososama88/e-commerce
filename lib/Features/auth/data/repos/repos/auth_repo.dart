import 'package:dartz/dartz.dart';
import 'package:food/Features/auth/data/models/login_model.dart';

import '../../../../../core/errors/failures.dart';


abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> fetchLogin({
    required email,
    required password,
});
  Future<Either<Failure, LoginModel>> fetchRegister({
    required email,
    required password,
    required phone,
    required name,
});
}
