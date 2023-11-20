import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/login_model.dart';

abstract class SettingRepo {

  Future<Either<Failure, LoginModel>> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String image,
});
  Future<Either<Failure, LoginModel>> getProfileData();

}