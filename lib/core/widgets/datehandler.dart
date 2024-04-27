import 'package:intl/intl.dart';

class DateHandler {
  static String formatDate(String date) {
   
   return DateFormat.yMd().format(DateTime.parse(date));
  }
}
