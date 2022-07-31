import 'package:dio/dio.dart';

class HeaderInterceptors extends Interceptor {
  HeaderInterceptors();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"example": "anyValue"});
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
