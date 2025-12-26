import 'dart:async';
import 'package:airportapp/core/error/app_exception.dart';
import 'package:airportapp/core/result/result.dart';
import 'package:grpc/grpc.dart';
import '../error/grpc_error_handler.dart';

Future<Result<T>> grpcCall<T>(Future<T> Function() call) async {
  try {

    return Success(await call());
  } on GrpcError catch (e) {

    return Failure(mapGrpcErrorToException(e));
  } catch (e) {
    
    return Failure(ServerException('unknown error: $e'));
  }
}
