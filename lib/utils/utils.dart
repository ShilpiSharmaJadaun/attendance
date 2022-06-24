import 'package:intl/intl.dart';

class Utils {
  static String getCurrentTime() {
    final now = DateTime.now();
    return DateFormat('hh mm aaa').format(now);
  }
}
