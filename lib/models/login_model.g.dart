// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginModelAdapter extends TypeAdapter<LoginModel> {
  @override
  final int typeId = 0;

  @override
  LoginModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginModel(
      employeeCode: fields[0] as String?,
      employeeName: fields[1] as String?,
      email_id: fields[2] as String?,
      department: fields[3] as String?,
      area: fields[4] as String?,
      authToken: fields[5] as String?,
      tokenValidityDate: fields[6] as String?,
      password: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.employeeCode)
      ..writeByte(1)
      ..write(obj.employeeName)
      ..writeByte(2)
      ..write(obj.email_id)
      ..writeByte(3)
      ..write(obj.department)
      ..writeByte(4)
      ..write(obj.area)
      ..writeByte(5)
      ..write(obj.authToken)
      ..writeByte(6)
      ..write(obj.tokenValidityDate)
      ..writeByte(7)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      employeeCode: json['eng_cd'] as String? ?? '',
      employeeName: json['eng_name'] as String?,
      email_id: json['email_id'] as String?,
      department: json['department'] as String?,
      area: json['area'] as String?,
      authToken: json['jwtToken'] as String?,
      tokenValidityDate: json['jwtvalidtill'] as String?,
      password: json['password'] as String? ?? ' ',
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('eng_cd', instance.employeeCode);
  writeNotNull('eng_name', instance.employeeName);
  writeNotNull('email_id', instance.email_id);
  writeNotNull('department', instance.department);
  writeNotNull('area', instance.area);
  writeNotNull('jwtToken', instance.authToken);
  writeNotNull('jwtvalidtill', instance.tokenValidityDate);
  writeNotNull('password', instance.password);
  return val;
}
