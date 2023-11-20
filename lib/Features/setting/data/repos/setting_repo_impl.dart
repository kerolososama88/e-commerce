import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/Features/setting/data/repos/setting_repo.dart';

import '../../../../core/Utils/function/api_servic.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/login_model.dart';

class SettingRepoImpl implements SettingRepo {
  final ApiService apiService;

  SettingRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginModel>> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String image,
}) async {
    try {
      Response data = await apiService.put(
        endPoint: 'update-profile',
        lang: 'en',
        data: {
          'email':email,
          'name':name,
          'phone':phone,
          'image':image,
        },
      );
      print('data.data${data.data}');
      return right(LoginModel.fromJson(data.data));
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, LoginModel>> getProfileData() async {
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