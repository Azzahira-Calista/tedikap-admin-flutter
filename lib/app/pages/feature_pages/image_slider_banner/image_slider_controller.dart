import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/image%20banner/banner_service.dart';
import 'package:tedikap_admin/app/data/model/image%20slider%20banner/image_slider_response.dart';

import '../../../data/model/data_helper.dart';
import '../../../data/model/image slider banner/image_slider_model.dart';

class ImageSliderController extends GetxController {
  RxBool isLoading = false.obs;
  late ImageSliderService imageSliderService;
  late SliderBannerResponse imageSliderResponse;
  var imageSliderResponseModel = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    imageSliderService = ImageSliderService();
    getImageSlider();
  } 

  Future<void> getImageSlider() async {
    try {
      isLoading(true);
      final response = await imageSliderService.getImageBanner();

      print("CHECK CURRENT RESPONSE");
      print(response.data);

      imageSliderResponse = DataHelper.parseJson(
          response.data, (json) => SliderBannerResponse.fromJson(json));
      imageSliderResponseModel.value = imageSliderResponse.data ?? [];

      print("check : ${imageSliderResponseModel}");
      print("check oiii : ${imageSliderResponse}");
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteImageSlider(int id) async {
    try {
      isLoading(true);
      final response = await imageSliderService.deleteImageBanner(id: id);
      print("Response: $response");

      isLoading(false);
      Get.snackbar("Delete image slider", "Image slider deleted successfully!");
    } catch (e) {
      isLoading(false);
      Get.snackbar("Error", "Failed to delete image slider");
    }
  }
}