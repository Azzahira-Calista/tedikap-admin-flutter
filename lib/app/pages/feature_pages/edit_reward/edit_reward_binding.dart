import 'package:get/get.dart';
import 'edit_reward_controller.dart';

class EditRewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditRewardController());
  }
  
}