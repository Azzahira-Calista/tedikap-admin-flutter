import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedRange = "Today".obs;

  void changeRange(String range) {
    selectedRange.value = range;
  }
}
