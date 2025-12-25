import 'package:airportapp/error/app_exception.dart';
import 'package:grpc/grpc.dart';

Exception mapGrpcErrorToException(GrpcError e) {
  switch (e.code) {
    case StatusCode.unauthenticated:
      return AuthException('unauthenticated');

    case StatusCode.permissionDenied:
      return AuthException('permissionDenied');

    case StatusCode.invalidArgument:
      return ValidationException(e.message ?? 'Некорректные данные');

    case StatusCode.notFound:
      return NotFoundException('notFound');

    case StatusCode.alreadyExists:
      return ConflictException('alreadyExists');

    case StatusCode.deadlineExceeded:
      return NetworkException('deadlineExceeded');

    case StatusCode.unavailable:
      return NetworkException('unavailable');

    default:
      return ServerException(
        e.message ?? 'unknown error',
      );
  }
}
