import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/history%20page/history_controller.dart';

class HistoryBinding extends Bindings {
   @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}