import 'dart:io';

import 'package:airportapp/core/error/app_exception.dart';
import 'package:dio/dio.dart';

AppException mapHttpErrorToException(Object e) {
  if (e is DioException){
    switch(e.type){
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('Connection timed out');

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 0;
        switch(statusCode){
          case 401:
            return AuthException('Unauthorized');
          case 403:
            return AuthException('Permission denied');
          case 404:
            return NotFoundException('Not found');
          case 409:
            return ConflictException('Conflict error');
          case 400:
            return ValidationException('Invalid argument');
          case 500:
            return ServerException('Server error');
        }

      case DioExceptionType.cancel:
        return NetworkException('Request cancelled');

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return NetworkException('No internet connection');
      default:
        return ServerException(e.message ?? 'Unknown error');
    }
  }

  if (e is SocketException){
    return NetworkException('No internet connection');
  }

  return ServerException('Unknown error: $e');
}