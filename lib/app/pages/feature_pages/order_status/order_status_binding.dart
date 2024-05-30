import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/order_status_controller.dart';

class OrderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderStatusController());
  }
}
