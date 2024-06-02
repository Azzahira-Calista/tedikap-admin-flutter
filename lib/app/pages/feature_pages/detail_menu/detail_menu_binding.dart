import 'package:get/get.dart';

import 'detail_menu_controller.dart';

class DetailMenuBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailMenuController());
  }
}