import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../models/attendance.dart';
import '../services/attendance_service.dart';
import '../services/login_service.dart';

class AttendanceCubit extends Cubit<List<Attendance>> {
  AttendanceCubit(this.loginService, this.attendanceService) : super([]);

  final LoginService loginService;
  final AttendanceService attendanceService;

  /// returns true if permission is granted
  Future<bool> checkIfPermissionIsGiven() async {
    final permission = await Geolocator.checkPermission();
    return permission.isGranted;
  }

  // returns true if permission is granted
  Future<bool> requestPermission() async {
    final permission = await Geolocator.requestPermission();
    return permission.isGranted;
  }

  Future<void> checkIn() async {
    try {
      final attendance = await attendanceService.getAttendanceDetails(
          loginService.getEmployerCode!, 'in', loginService.getToken);
      emit([attendance!]);

    } catch (error) {
      rethrow;
    }
  }

  Future<void> checkOut() async {
    try {
      final attendance = await attendanceService.getAttendanceDetails(
          loginService.getEmployerCode!, 'out', loginService.getToken);
      emit([attendance!]);
    } catch (error) {
      rethrow;
    }
  }
}

extension LocationPermissionExtension on LocationPermission {
  bool get isGranted => this == LocationPermission.always || this == LocationPermission.whileInUse;
  bool get isDenied => this == LocationPermission.denied;
}