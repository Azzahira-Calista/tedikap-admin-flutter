import 'package:get/get.dart';

import 'tambah_slider_banner_controller.dart.dart';

class TambahSliderBannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TambahSliderBannerController());
  }
}