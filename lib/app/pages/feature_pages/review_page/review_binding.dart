import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/review_controller.dart';

class ReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(() => ReviewController());
  }
  
}