import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_promo/tambah_promo_controller.dart';

class TambahPromoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPromoController>(() => TambahPromoController());
  }
}