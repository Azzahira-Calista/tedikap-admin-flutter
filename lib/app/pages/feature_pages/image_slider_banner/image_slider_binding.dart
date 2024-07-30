import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/image_slider_banner/image_slider_controller.dart';

class ImageSliderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageSliderController());
  }
  
}