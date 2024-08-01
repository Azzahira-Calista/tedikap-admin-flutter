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

   void updateCategory(String category) {
    currentCategory.value = category;
    fetchFilteredProducts(category);
  }

@override
  void onReady() {
    super.onReady();
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

   Future<void> fetchFilteredProducts(String category) async {
    try {
      isLoading(true);
      final response = await rewardService.getFilterReward(query: category);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        rewardResponseModel.value = data.map((json) => Data.fromJson(json)).toList();
        print('Filtered products loaded: ${rewardResponseModel.length}');
      } else {
        rewardResponseModel.clear();
        print('No products found for category: $category');
      }
    } catch (e) {
      print('Error fetching filtered products: $e');
    } finally {
      isLoading(false);
    }
  }
}
