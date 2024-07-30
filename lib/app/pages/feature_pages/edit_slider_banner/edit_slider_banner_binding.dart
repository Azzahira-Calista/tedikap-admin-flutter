import 'package:get/get.dart';
import 'edit_slider_banner_controller.dart';

class EditSliderBannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditSliderBannerController());
  }
  
}