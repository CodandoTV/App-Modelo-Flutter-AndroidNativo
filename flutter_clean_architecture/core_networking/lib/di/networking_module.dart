import 'package:core_networking/interceptor/header_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:core/core_module.dart';

import '../interceptor/error_interceptor.dart';

const _normalTimeout = 15000;

class NetworkingModule {
  static void init() {
    getIt.registerLazySingleton(() {
      final dio = Dio(BaseOptions(
        receiveTimeout: _normalTimeout,
        connectTimeout: _normalTimeout,
        sendTimeout: _normalTimeout,
        baseUrl: "http://demo5700495.mockable.io/",
      ));
      dio.interceptors.add(HeaderInterceptors());
      dio.interceptors
          .add(LogInterceptor(requestBody: true, requestHeader: true));
      dio.interceptors.add(ErrorInterceptors());
      return dio;
    });
  }
}
