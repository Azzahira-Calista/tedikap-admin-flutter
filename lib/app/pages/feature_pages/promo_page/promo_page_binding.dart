import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/promo_page/promo_page_controller.dart';

class PromoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PromoPageController());
  }
}