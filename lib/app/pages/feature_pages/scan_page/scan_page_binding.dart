import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/scan_page/scan_page_controller.dart';

class ScanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanPageController>(() => ScanPageController());
  }
  
}