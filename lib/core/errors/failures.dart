import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  // ignore: deprecated_member_use
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      // ignore: deprecated_member_use
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      // ignore: deprecated_member_use
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      // ignore: deprecated_member_use
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      // ignore: deprecated_member_use
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );

      // ignore: deprecated_member_use
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer Was cancel');

      // ignore: deprecated_member_use
      case DioErrorType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error , Please try again!');
      default:
        return ServerFailure('Opps There was an error,Pleas try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your response not found,Pleas try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error,Pleas try later!');
    } else {
      return ServerFailure('Opps There was an error,Pleas try again!');
    }
  }
}
