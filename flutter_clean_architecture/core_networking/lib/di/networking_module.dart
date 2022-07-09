import 'package:dio/dio.dart';
import 'package:core/core_module.dart';

const _normalTimeout = 15000;

class NetworkingModule {
  static void init() {
    getIt.registerLazySingleton(() {
      final dio = Dio( BaseOptions(
        receiveTimeout: _normalTimeout,
        connectTimeout: _normalTimeout,
        sendTimeout: _normalTimeout,
        baseUrl: "http://demo5700495.mockable.io/",
      ));
      dio.interceptors.add(getIt<LogInterceptor>());
      return dio;
    });

    getIt.registerSingleton(
        LogInterceptor(requestBody: true, requestHeader: true));

  }
}
