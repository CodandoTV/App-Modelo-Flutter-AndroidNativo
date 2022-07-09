import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/user_response_model.dart';

part 'user_api_datasource.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET("/flutter-list")
  Future<List<UserResponse>> getUsers();
}
