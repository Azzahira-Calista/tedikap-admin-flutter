import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/order_page_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
  }
}
