import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_voucher/edit_voucher_controller.dart';

class EditVoucherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditVoucherController());
  }
}
