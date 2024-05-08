import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/order_status_controller.dart';

class OrderStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderStatusController());
  }
}
