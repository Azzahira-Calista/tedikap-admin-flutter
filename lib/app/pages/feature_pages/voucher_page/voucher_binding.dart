import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/voucher_controller.dart';

class VoucherBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VoucherController());
  }
}