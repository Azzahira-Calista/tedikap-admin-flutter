import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_menu/tmbah_menu_controller.dart';

class TambahMenuBinding extends Bindings {
 @override
  void dependencies() {
    Get.lazyPut(() => TambahMenuController());
  }}