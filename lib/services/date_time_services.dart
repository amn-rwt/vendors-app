import 'package:ntp/ntp.dart';

class DateTimeServices {
  static Future<String> getDay() async {
    final day = await NTP.now();
    return '${day.weekday.toString()}';
  }
}
