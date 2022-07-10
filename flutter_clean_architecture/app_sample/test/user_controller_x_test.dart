import 'package:app_sample/home/domain/model/user_model.dart';
import 'package:app_sample/home/domain/user_usecase_list.dart';
import 'package:app_sample/home/presentation/mobx/user_controller_x.dart';
import 'package:app_sample/home/presentation/mobx/user_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'user_controller_x_test.mocks.dart';
import 'user_shared.dart';

@GenerateMocks([
  UserUseCaseList,
])
void main() {
  late MockUserUseCaseList usecase;
  late UserListControllerX controller;

  setUp(() {
    usecase = MockUserUseCaseList();
    controller = UserListControllerX(usecase);
  });

  test('show loading as initial state', () async {
    expect(controller.state, UserLoadingStateX());
  });

  test('show load state screen', () async {
    when(usecase.getUsers()).thenAnswer((_) async => users);

    await controller.loadUsers();

    expect(controller.state, UserSuccessStateX(users: users));
  });
}
