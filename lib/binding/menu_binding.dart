import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuController());
  }
}
