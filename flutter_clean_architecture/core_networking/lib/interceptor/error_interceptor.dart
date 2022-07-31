import 'dart:io';
import 'package:dio/dio.dart';

import '../error/NetworkErrorException.dart';

class ErrorInterceptors extends Interceptor {
  ErrorInterceptors();

  @override
  void onError(DioError e, ErrorInterceptorHandler handler) {
    DioError newError = e;
    try {
      if (e.error is IOException) {
        newError = e.copyWith(FailureException.networkException);
      } else if (newError.error is FormatException) {
        newError = e.copyWith(FailureException.malformedJsonException);
      }
    } catch (Exception) {
      newError = e.copyWith(FailureException.genericException);
    }

    handler.next(newError);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

extension DioMapper on DioError {
  DioError copyWith(NetworkErrorException error) {
    this.error = error;
    return this;
  }
}
