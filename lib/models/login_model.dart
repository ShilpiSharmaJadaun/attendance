import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'login_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(includeIfNull: false)
class LoginModel {
  @HiveField(0)
  @JsonKey(name: 'eng_cd')
  late final String? employeeCode;

  @HiveField(1)
  @JsonKey(name: 'eng_name')
  late final String? employeeName;

  @HiveField(2)
  late final String? email_id;

  @HiveField(3)
  late final String? department;

  @HiveField(4)
  late final String? area;

  @HiveField(5)
  @JsonKey(name: 'jwtToken')
  late final String? authToken;

  @HiveField(6)
  @JsonKey(name: 'jwtvalidtill')
  late final String? tokenValidityDate;

  @HiveField(7)
  @JsonKey(name: 'password')
  final String? password;

  LoginModel
      ({
    this.employeeCode= '',
    this.employeeName,
    this.email_id,
    this.department,
    this.area,
    this.authToken,
    this.tokenValidityDate,
    this.password = ' '
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  String toString() =>  'employeeCode: $employeeCode, password: $password';
}