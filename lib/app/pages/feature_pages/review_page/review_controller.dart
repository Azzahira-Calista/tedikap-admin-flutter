import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/review/review_service.dart';
import 'package:tedikap_admin/app/data/model/review/review_model.dart';
import 'package:tedikap_admin/app/data/model/review/review_response.dart';

class ReviewController extends GetxController {
  RxBool isLoading = false.obs;
  RxString selectrdTab = 'All'.obs;
  late ReviewService reviewService;
  late ReviewResponse reviewResponse;
  RxList<Data> reviewResponseModel = <Data>[].obs;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    reviewService = ReviewService();
    getReview();
  }

  Future<void> getReview() async {
    try {
      isLoading.value = true;
      final response = await reviewService.getReviews();
      reviewResponse = ReviewResponse.fromJson(response.data);
      reviewResponseModel.value = reviewResponse.data ?? [];
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    if (index == 0) {
      selectrdTab.value = 'All';
      // getHistoryOrder();
    } else if (index == 1) {
      selectrdTab.value = '1 ⭐';
      // getHistoryOrderReward();
    } else if (index == 2) {
      selectrdTab.value = '2 ⭐';
      // getHistoryOrderAll();
    } else if (index == 3) {
      selectrdTab.value = '3 ⭐';
      // getHistoryOrderCancel();
    } else if (index == 4) {
      selectrdTab.value = '4 ⭐';
      // getHistoryOrderCancel();
    } else if (index == 5) {
      selectrdTab.value = '5 ⭐';
      // getHistoryOrderCancel();
    }
  }
}
