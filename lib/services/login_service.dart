import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../errors/api_error.dart';
import '../models/login_model.dart';
import 'constants.dart';

class LoginService{

  final _box = Hive.box('login_box');
  LoginModel? _loginModel;
  String _token = '';

  LoginService() {
    _loginModel = _box.get('user') as LoginModel?;
  }

  LoginModel? get getCurrentUser => _loginModel;
  String? get getEmployerCode => _loginModel!.employeeCode;
  String get getToken => _token;
  //String? get getPassword => _loginModel!.password;

  Future<void> logIn(String employeeCode, String password,
      [bool shouldRemember = false]) async {
    final body = {'user_id': employeeCode, 'password': password};
    const url = root + 'Token/login';

    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode(body), headers: headers);

      final responseBody = response.body;
      final result = json.decode(responseBody);
      final isLoggedIn = result['status'];

      if (isLoggedIn) {
        final data = Map<String, dynamic>.from(result['data']);
        data.putIfAbsent('password', () => password);
        print(data)
;        final user = LoginModel.fromJson(data);

        _loginModel = user;
        _token = result['data']['jwtToken'];
        if (shouldRemember) await _box.put('user', user);
      } else {
        throw ApiError.invalidDetails;
      }
    } catch (e) {
      print(e);
      _handleError(e);
    }
  }

  _handleError(var e) {
    if (e is SocketException) throw ApiError.internet();
    if (e is TimeoutException) throw ApiError.timeOut();
    if (e is ApiError) throw e;
    throw ApiError.unKnown();
  }
}