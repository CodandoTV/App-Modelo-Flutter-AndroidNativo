import 'package:core/core_module.dart';
import 'package:dio/dio.dart';
import '../data/service/user_api_datasource.dart';
import '../data/user_repository_impl.dart';
import '../domain/user_analytics.dart';
import '../domain/user_repository.dart';
import '../domain/user_usecase_list.dart';
import '../presentation/bloc/user_controller.dart';
import '../presentation/bloc/user_event.dart';
import '../presentation/mobx/user_controller_x.dart';

class UserModule {
  UserModule._();

  static void init() {
    getIt.pushNewScope(
        scopeName: _User_MODULE,
        init: (getIt) {
          getIt.registerFactory<UserUseCaseList>(
              () => UserUseCaseListImpl(getIt<UserRepository>()));

          getIt.registerFactory<UserRepository>(
              () => UserRepositoryImpl(getIt<UserApi>()));

          getIt.registerFactory<UserAnalytics>(() => UserAnalyticsImpl());

          getIt.registerFactory<UserApi>(() => UserApi(getIt<Dio>()));

          getIt.registerFactory<UserController>(() =>
              UserController(getIt<UserUseCaseList>())
                ..add(UserListLoadEvent()));

          getIt.registerFactory<UserListControllerX>(
              () => UserListControllerX());
        });
  }

  static void dispose() {
    getIt.popScopesTill(_User_MODULE);
  }

  static const String _User_MODULE = "UserModule";
}
