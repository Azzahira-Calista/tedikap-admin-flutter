import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/tambah_voucher_controller.dart';

class TambahVoucherBinding extends Bindings {
 @override
  void dependencies() {
    Get.lazyPut(() => TambahVoucherController());
  }}