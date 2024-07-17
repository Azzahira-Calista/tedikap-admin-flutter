import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/reward/reward_service.dart';
import 'package:tedikap_admin/app/data/model/reward/reward_model.dart';
import 'package:tedikap_admin/app/data/model/reward/reward_response.dart';

import '../../../../routes/AppPages.dart';
import '../../../api/dio_instance.dart';

class DetailRewardController extends GetxController {
  late final int id;

  RxBool isLoading = false.obs;
  late RewardService rewardService;
  late RewardResponse rewardResponse;

  var productResponseModel = <Data>[].obs;

  DioInstance instance = DioInstance();

  @override
  void onInit() {
    super.onInit();
    // Initialize productService
    rewardService = RewardService();

    if (Get.arguments != null && Get.arguments.containsKey('id')) {
      id = Get.arguments['id'] as int;
      loadData();
    } else {
      Get.snackbar("Error", "No ID found in arguments");
      Get.back();
    }
  }

  void loadData() async {
    isLoading.value = true;
    try {
      // Simulate data loading
      await Future.delayed(Duration(seconds: 2));
      // Here you can fetch data from the server using the `id`
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to load data");
    }
  }

  Future<void> deleteReward() async {
    try {
      isLoading.value = true;
      final response = await rewardService.deleteReward(id);
      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Delete reward product", "Product deleted successfully!");
      Get.toNamed(Routes.NAVBAR + Routes.MENU);
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }
}