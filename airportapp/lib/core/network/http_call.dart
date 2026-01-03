import 'package:airportapp/core/error/http_handler.dart';
import 'package:airportapp/core/result/result.dart';

Future<Result<T>> httpCall<T>(Future<T> Function() call,) async {
  try {
    final result = await call();
    return Success(result);
  } catch (e) {

    return Failure(mapHttpErrorToException(e));
  }
}