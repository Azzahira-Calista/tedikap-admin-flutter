import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_voucher_controller.dart';

class TambahVoucherBinding extends Bindings {
 @override
  void dependencies() {
    Get.lazyPut(() => TambahVoucherController());
  }}