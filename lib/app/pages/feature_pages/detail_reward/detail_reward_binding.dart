import 'package:get/get.dart';

import 'detail_reward_controller.dart';

class DetailRewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRewardController>(() => DetailRewardController());
  }
}