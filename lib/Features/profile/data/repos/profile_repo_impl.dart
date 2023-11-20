import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/Features/profile/data/repos/profile_repo.dart';

import '../../../../core/Utils/function/api_servic.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/login_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginModel>> fetchProfile() async {
    try {
      Response data = await apiService.get(
        endPoint: 'profile',
        lang: 'en',
      );
      return right(LoginModel.fromJson(data.data));
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}