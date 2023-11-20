import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food/Features/search/data/models/search_model.dart';
import 'package:food/Features/search/data/repos/search_repo.dart';
import '../../../../core/Utils/function/api_servic.dart';
import '../../../../core/errors/failures.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);


  @override
  Future<Either<Failure, SearchModel>> fetchSearch({required text}) async {
    try {
      Response data = await apiService.post(
        endPoint: 'products/search',
        lang: 'en',
        data: {
          'text':text,
        },
      );
      print('SearchModel.fromJson(data.data)${SearchModel.fromJson(data.data)}');
      return right(SearchModel.fromJson(data.data));
    } catch (e) {
      print('Error>>>>>$e');
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
