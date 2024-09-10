 import 'package:intl/intl.dart';

String formatRupiah(num amount) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(amount);
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy MMMM dd, HH:mm');
    return formatter.format(dateTime);
  }

  String formatTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

 String formatTimeString(String timeString) {
   if (timeString.isEmpty) {
     return '';
   }

   final DateTime parsedTime = DateTime.parse('1970-01-01T$timeString');
   final DateFormat formatter = DateFormat('HH:mm');
   return formatter.format(parsedTime);
 }