import 'package:attendance/services/login_service.dart';
import 'package:attendance/states/login_state.dart';
import 'package:bloc/bloc.dart';

import '../errors/api_error.dart';

class LogInPageBloc extends Cubit<LoginPageState> {
  LogInPageBloc(this.loginService) : super(LoginPageState.initial());

  final LoginService loginService;

  void init() {
    emit(LoginPageState.loading(state.form));
    final user = loginService.getCurrentUser;
    final form = state.form.copyWith(
        username: user?.employeeCode ?? '',
      password:  user?.password ?? '',
    );
    emit(LoginPageState.content(form));
  }

  void updateUsername(String username) => _updateAttributes(username: username);

  void updatePassword(String password) => _updateAttributes(password: password);

  void updateShouldRememberStatus(bool? shouldRemember) =>
      _updateAttributes(shouldRemember: shouldRemember);

  void _updateAttributes(
      {String? password, String? username, bool? shouldRemember}) {
    emit(LoginPageState.loading(state.form));
    final form = state.form.copyWith(
      password: password ?? state.form.password,
      username: username ?? state.form.username,
      shouldRemember: shouldRemember ?? state.form.shouldRemember,
    );
    emit(LoginPageState.content(form));
  }

  void logIn() async {
    _validate();

    var form = state.form;
    if (form.errors.isNotEmpty) return;

    emit(LoginPageState.loading(form));
    try {
      await loginService.logIn(
          form.username, form.password, form.shouldRemember);
      emit(LoginPageState.success(form));
    } on ApiError catch (e) {
      print(e);
      emit(LoginPageState.failed(form, e.message));
    }
  }

  _validate() {
    var form = state.form;
    emit(LoginPageState.loading(form));

    final errors = <String, String?>{};

    if (form.username.isEmpty) {
      errors['username'] = 'Employee code can\'t be empty';
    }
    if (form.password.isEmpty) {
      errors['password'] = 'Password can\'t be empty';
    }
    emit(LoginPageState.content(form.copyWith(errors: errors)));
  }
}