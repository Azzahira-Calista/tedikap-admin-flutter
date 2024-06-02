import 'package:get/get.dart';
import 'edit_menu_controller.dart';

class EditMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditMenuController());
  }
  
}