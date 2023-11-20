import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/Features/home/data/models/home_model.dart';
import '../../../../core/Utils/function/api_servic.dart';
import '../../../../core/errors/failures.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, HomeModel>> fetchCategoryItems() async {
    try {
      Response data = await apiService.get(
        endPoint: 'home',
        lang: 'en',
      );
      return right(HomeModel.fromJson(data.data));
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}
