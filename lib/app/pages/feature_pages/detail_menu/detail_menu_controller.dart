import 'package:get/get.dart';

class DetailMenuController extends GetxController{
  late final int id;
  @override
void onInit() {
  id = Get.arguments['id'] as int; 
  
  super.onInit();
}
  @override
  void onReady() {
    // TODO: implement onReady
    print("bismillah: $id");
    super.onReady();
  }
}
