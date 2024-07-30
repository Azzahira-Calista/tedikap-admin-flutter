import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_box_promo/edit_box_promo_controller.dart';

class EditBoxPromoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditBoxPromoController());
  }
}