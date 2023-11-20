import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/Utils/function/api_servic.dart';
import '../../../../../core/errors/failures.dart';
import '../../models/login_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginModel>> fetchLogin({
    required email,
    required password,
  }) async {
    try {
      Response data = await apiService.post(
        endPoint: 'login',
        data: {
          'email': email,
          'password': password,
        },
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

  @override
  Future<Either<Failure, LoginModel>> fetchRegister({
    required email,
    required password,
    required phone,
    required name,
  }) async {
    try {
      Response data = await apiService.post(
        endPoint: 'register',
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
        },
        lang: 'en',
      );
      print('data.data>>>>>>${data.data}');
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
