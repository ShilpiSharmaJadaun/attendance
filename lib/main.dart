import 'package:attendance/bloc/attendance_bloc.dart';
import 'package:attendance/models/login_model.dart';
import 'package:attendance/services/attendance_service.dart';
import 'package:attendance/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path_provider.getApplicationDocumentsDirectory();

  Hive
    ..init(directory.path)
    ..registerAdapter(LoginModelAdapter());

  await Hive.openBox('login_box');

  final service =  LoginService();
  final attendanceService = AttendanceService();


  final myApp = MultiProvider(
    providers: [
      Provider<LoginService>(create: (_) => service),
    Provider<AttendanceService>(create: (_) => attendanceService,)
    ],
    child: BlocProvider(
        create: (_) => AttendanceCubit(service, attendanceService),
        child: const MyApp()),
  );

  runApp(myApp);
}
