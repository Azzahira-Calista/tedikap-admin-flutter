import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/tmbah_menu_controller.dart';

class TambahMenuBinding extends Bindings {
 @override
  void dependencies() {
    Get.lazyPut(() => TambahMenuController());
  }}