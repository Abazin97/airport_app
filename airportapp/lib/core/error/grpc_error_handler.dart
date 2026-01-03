import 'package:airportapp/core/error/app_exception.dart';
import 'package:grpc/grpc.dart';

AppException mapGrpcErrorToException(GrpcError e) {
  if (e.code == StatusCode.unavailable){
    final message = e.message?.toLowerCase() ?? '';
    if (message.contains('socketexception') || 
        message.contains('connection refused') ||
        message.contains('network is unreachable')){
      return NetworkException('No internet connection');
    }

    return NetworkException('Service unavailable');
  }
  switch (e.code) {
    case StatusCode.unauthenticated:
      return AuthException('Unauthenticated');

    case StatusCode.permissionDenied:
      return AuthException('Permission denied');

    case StatusCode.invalidArgument:
      return ValidationException(e.message ?? 'Invalid argument');

    case StatusCode.notFound:
      return NotFoundException('Not found');

    case StatusCode.alreadyExists:
      return ConflictException(e.message ?? 'User already exists');

    case StatusCode.deadlineExceeded:
      return NetworkException('Deadline exceeded');

    case StatusCode.unavailable:
      return NetworkException('Service unavailable');

    default:
      return ServerException(
        e.message ?? 'unknown error',
      );
  }
}
