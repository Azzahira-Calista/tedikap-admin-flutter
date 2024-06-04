import 'package:get/get.dart';

class DetailMenuController extends GetxController {
  late final int id;
  var isLoading = true.obs;

  @override
  void onInit() {
    id = Get.arguments['id'] as int;
    loadData();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print("bismillah: $id");
    super.onReady();
  }

  void loadData() async {
    // Simulate data loading
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }
}
