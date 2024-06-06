import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/promo_page/promo_controller.dart';

class PromoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PromoController());
  }
}