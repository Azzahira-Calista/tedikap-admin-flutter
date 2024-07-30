import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/history_page/history_controller.dart';

class HistoryBinding extends Bindings {
   @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}