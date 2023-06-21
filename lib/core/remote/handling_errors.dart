import 'package:dio/dio.dart';
import 'package:group_chat_app/core/remote/exceptions.dart';
import 'package:group_chat_app/core/remote/status_code.dart';
abstract class HandlingErrors{
 static handleDioError(DioException error) {
    switch (error.error) {
      case DioException.connectionTimeout:
      case DioException.sendTimeout:
      case DioException.receiveTimeout:
      case DioException.connectionError:
      case DioException.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internetServerError:
            throw const InternetServerErrorException();
        }
        default:
        throw const InternetServerErrorException();
    }
  }
}