import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedRange = "This Week".obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void changeRange(String range) {
    selectedRange.value = range;
  }

  void loadData() async {
    // Simulate data loading
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }
}
