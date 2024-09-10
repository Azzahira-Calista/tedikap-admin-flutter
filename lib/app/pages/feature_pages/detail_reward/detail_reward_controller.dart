import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/reward/reward_service.dart';
import 'package:tedikap_admin/app/api/stok/status_stok_product_service.dart';
import 'package:tedikap_admin/app/data/model/reward/reward_model.dart';
import 'package:tedikap_admin/app/data/model/reward/reward_response.dart';

import '../../../../routes/AppPages.dart';
import '../../../api/dio_instance.dart';

class DetailRewardController extends GetxController {
  late final int id;
  RxBool isSwitched = false.obs;

  RxBool isLoading = false.obs;
  late RewardService rewardService;
  late RewardResponse rewardResponse;
  StatusStockProductService? statusStockProductService;

  var productResponseModel = <Data>[].obs;

  DioInstance instance = DioInstance();

  @override
  void onInit() {
    super.onInit();
    statusStockProductService = StatusStockProductService();
    rewardService = RewardService();
    isSwitched.value = Get.arguments['stock'] ?? false;
    // print("Initial stock status reward: ${Get.arguments['stock']}");

    // if (Get.arguments != null && Get.arguments.containsKey('id')) {
    //   id = Get.arguments['id'] as int;
    //   loadData();
    // } else {
    //   Get.snackbar("Error", "No ID found in arguments");
    //   Get.back();
    // }
    final Map<String, dynamic> arguments = Get.arguments;
    id = arguments['id'];
    // print(id);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  }

  void toggeStockReward(bool value) async {
      // print("toggeStockReward value: $value");

    isSwitched.value = value;
    await changeStockAvailable(value);
    // if (value) {
    //   await changeStockAvailable(true);
    // } else {
    //   await changeStockAvailable(false);
    // }
  }

  Future<void> changeStockAvailable(bool stock) async {
    print("isStock called");
    try {
      final response =
          await statusStockProductService?.updateStockReward(id, stock);
      Get.snackbar("Success", "Stock updated successfully");
      // print('testtt');
      // print(response);
    } catch (e) {
      // print("isStock error: $e");
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> deleteReward() async {
    try {
      isLoading.value = true;
      final response = await rewardService.deleteReward(id);
      // print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Delete reward product", "Product deleted successfully!");
      Get.offAndToNamed(Routes.NAVBAR + Routes.MENU);
    } catch (e) {
      isLoading.value = false;
      // print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }
}
