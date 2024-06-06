import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_promo_controller.dart';

class TambahPromoBinding extends Bindings {
 @override
  void dependencies() {
    Get.lazyPut(() => TambahPromoController());
  }}