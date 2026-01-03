import 'dart:async';
import 'dart:io';
import 'package:airportapp/core/error/app_exception.dart';
import 'package:airportapp/core/result/result.dart';
import 'package:grpc/grpc.dart';
import '../error/grpc_error_handler.dart';

Future<Result<T>> grpcCall<T>(Future<T> Function() call,) async {
  // final isOnline = context.read<NetworkBloc>().state;
  // if (!isOnline.isConnected) {
  //   return Failure(NetworkException('No internet connection'));
  // }

  try {

    return Success(await call());
  } on GrpcError catch (e) {

    return Failure(mapGrpcErrorToException(e));
  } on SocketException{
    
    return Failure(NetworkException('No internet connection'));
  } catch (e) {
    
    return Failure(ServerException('unknown error: $e'));
  }
}
