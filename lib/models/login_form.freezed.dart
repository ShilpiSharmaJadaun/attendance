// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginForm {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get shouldRemember => throw _privateConstructorUsedError;
  Map<String, String?> get errors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginFormCopyWith<LoginForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginFormCopyWith<$Res> {
  factory $LoginFormCopyWith(LoginForm value, $Res Function(LoginForm) then) =
      _$LoginFormCopyWithImpl<$Res>;
  $Res call(
      {String username,
      String password,
      bool shouldRemember,
      Map<String, String?> errors});
}

/// @nodoc
class _$LoginFormCopyWithImpl<$Res> implements $LoginFormCopyWith<$Res> {
  _$LoginFormCopyWithImpl(this._value, this._then);

  final LoginForm _value;
  // ignore: unused_field
  final $Res Function(LoginForm) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? shouldRemember = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      shouldRemember: shouldRemember == freezed
          ? _value.shouldRemember
          : shouldRemember // ignore: cast_nullable_to_non_nullable
              as bool,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginFormCopyWith<$Res> implements $LoginFormCopyWith<$Res> {
  factory _$$_LoginFormCopyWith(
          _$_LoginForm value, $Res Function(_$_LoginForm) then) =
      __$$_LoginFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {String username,
      String password,
      bool shouldRemember,
      Map<String, String?> errors});
}

/// @nodoc
class __$$_LoginFormCopyWithImpl<$Res> extends _$LoginFormCopyWithImpl<$Res>
    implements _$$_LoginFormCopyWith<$Res> {
  __$$_LoginFormCopyWithImpl(
      _$_LoginForm _value, $Res Function(_$_LoginForm) _then)
      : super(_value, (v) => _then(v as _$_LoginForm));

  @override
  _$_LoginForm get _value => super._value as _$_LoginForm;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
    Object? shouldRemember = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$_LoginForm(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      shouldRemember: shouldRemember == freezed
          ? _value.shouldRemember
          : shouldRemember // ignore: cast_nullable_to_non_nullable
              as bool,
      errors: errors == freezed
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
    ));
  }
}

/// @nodoc

class _$_LoginForm implements _LoginForm {
  const _$_LoginForm(
      {this.username = '',
      this.password = '',
      this.shouldRemember = false,
      final Map<String, String?> errors = const {}})
      : _errors = errors;

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool shouldRemember;
  final Map<String, String?> _errors;
  @override
  @JsonKey()
  Map<String, String?> get errors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  String toString() {
    return 'LoginForm(username: $username, password: $password, shouldRemember: $shouldRemember, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginForm &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.shouldRemember, shouldRemember) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(shouldRemember),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  _$$_LoginFormCopyWith<_$_LoginForm> get copyWith =>
      __$$_LoginFormCopyWithImpl<_$_LoginForm>(this, _$identity);
}

abstract class _LoginForm implements LoginForm {
  const factory _LoginForm(
      {final String username,
      final String password,
      final bool shouldRemember,
      final Map<String, String?> errors}) = _$_LoginForm;

  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  bool get shouldRemember => throw _privateConstructorUsedError;
  @override
  Map<String, String?> get errors => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginFormCopyWith<_$_LoginForm> get copyWith =>
      throw _privateConstructorUsedError;
}
