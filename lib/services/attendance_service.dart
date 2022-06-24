import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:attendance/models/attendance.dart';
import 'package:attendance/utils/utils.dart';
import '../errors/api_error.dart';
import '../models/address.dart';
import '../services/constants.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AttendanceService {
  Future<Attendance?> getAttendanceDetails(
      String employeeCode, String punchtype, String token) async {
    const url = root + 'Attendence/mark_attendence';
    try {
      final location = await Geolocator.getCurrentPosition();
      final results = await placemarkFromCoordinates(location.latitude, location.longitude);
      //final results = await http.get(Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=AIzaSyAFm0BT5mfJODquWAsX1ECGfkwr_2Jk6Po'));
      // print("result");
      print(results);
      // print("address");
      var address = Address();

      if (results.isNotEmpty) {
        final placemark = results.first as Placemark;
        print(placemark.toJson());
        address = Address.fromJson(placemark.toJson());
      }
      final body = {
        'eng_cd': employeeCode,
        'latitude': location.latitude.toString(),
        'longitude': location.longitude.toString(),
        'address': address.subLocality +
            ' ' +
            address.street +
            " " +
            address.name +
            " " +
            address.postalCode,
        'punchtype': punchtype,
      };

      final response =
          await http.post(Uri.parse(url), body: json.encode(body), headers: {
        'Accept': 'Application/json',
        'Content-Type': 'Application/json',
        "Authorization": "bearer $token"
      });

      final responseBody = json.decode(response.body);
      if (responseBody['status'] == false) {
        throw ApiError.fromResponse(responseBody['message']);
      }
      body.putIfAbsent('time', () => Utils.getCurrentTime());
      return Attendance.fromJson(body);
    } on ApiError catch (e) {
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
