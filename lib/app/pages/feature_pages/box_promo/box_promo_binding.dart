import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/box_promo/box_promo_controller.dart';

class BoxPromoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoxPromoController());
  }
  
}