import 'dart:async';
import 'package:airportapp/error/app_exception.dart';
import 'package:grpc/grpc.dart';
import '../error/grpc_error_handler.dart';

Future<T> grpcCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on GrpcError catch (e) {
    throw mapGrpcErrorToException(e);
  } on TimeoutException {
    throw NetworkException('timeout exceeded');
  } catch (e) {
    throw ServerException('unknown error: $e');
  }
}
