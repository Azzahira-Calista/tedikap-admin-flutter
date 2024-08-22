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
  RxString currentFilter = 'All'.obs;

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

  Future<void> getReviewByRatings(int rating) async {
    try {
      isLoading(true);
      final response = await reviewService.getReviewByRating(rating);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        reviewResponseModel.value =
            data.map((json) => Data.fromJson(json)).toList();
        print('Filtered products loaded: ${reviewResponseModel.length}');
      } else {
        reviewResponseModel.clear();
        print('No products found for rating: $rating');
      }
    } catch (e) {
      print('Error fetching filtered rating: $e');
    } finally {
      isLoading(false);
    }
  }

  void updateRating(int rating) {
    if (rating == 0) {
      getReview();
    } else {
      getReviewByRatings(rating);
    }
    currentFilter.value = rating == 0 ? 'All' : rating.toString();
  }
  
}
