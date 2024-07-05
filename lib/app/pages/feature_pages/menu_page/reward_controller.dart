import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/reward/reward_service.dart';
import 'package:tedikap_admin/app/data/model/reward/reward_model.dart';
import 'package:tedikap_admin/app/data/model/reward/reward_response.dart';

class RewardController extends GetxController {
  RxBool isLoading = false.obs;

  late RewardService rewardService;
  late RewardResponse rewardResponse;
  var rewardResponseModel = <Data>[].obs;

  RxInt currentIndex = 0.obs;
  RxString currentCategory = 'tea'.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();

    rewardService = RewardService();
    getReward();
  }

  Future<void> getReward() async {
    try {
      isLoading.value = true;

      final response = await rewardService.getReward();

      rewardResponse = RewardResponse.fromJson(response.data);
      rewardResponseModel = rewardResponse.data.obs;
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
