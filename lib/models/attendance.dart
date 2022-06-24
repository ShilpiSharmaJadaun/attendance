class Attendance {
  final String time, address;
  final String latitude, longitude;

  const Attendance(
      {required this.time,
      required this.address,
      required this.latitude,
      required this.longitude});

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
        time: json['time'],
        address: json['address'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
}
