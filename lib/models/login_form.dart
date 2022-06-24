import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form.freezed.dart';

@freezed
class LoginForm with _$LoginForm {
  const factory LoginForm({
    @Default('') String username,
    @Default('') String password,
    @Default(false) bool shouldRemember,
    @Default({}) Map<String, String?> errors,
  }) = _LoginForm;
}