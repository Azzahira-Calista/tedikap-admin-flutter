import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_reward_product/tambah_reward_controller.dart';

class TambahRewardBinding extends Bindings {
 @override
  void dependencies() {
    Get.lazyPut(() => TambahRewardController());
  }}