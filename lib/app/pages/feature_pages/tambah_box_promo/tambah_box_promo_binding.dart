import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_box_promo/tambah_box_promo_controller.dart';

class TambahBoxPromoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TambahBoxPromoController());
  }
  
}