import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/api/image%20banner/banner_service.dart';
import 'package:tedikap_admin/app/data/model/image%20slider%20banner/image_slider_response.dart';

import '../../../../routes/AppPages.dart';
import '../../../data/model/image slider banner/image_slider_model.dart';

class TambahSliderBannerController extends GetxController {
  RxString imagePath = ''.obs;
  RxBool isLoading = false.obs;

  ImageSliderService imageSliderService = ImageSliderService();
  late SliderBannerResponse imageSliderResponse;
  var imageSliderResponseModel = <Data>[].obs;

  void setImagePath(String path) {
    imagePath.value = path;
    update();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setImagePath(pickedFile.path);
    }
  }

  Future<void> addSliderBanner() async {
    try {
      isLoading.value = true;

      final response = await imageSliderService.storeImageBanner(
          image: imagePath.value.isNotEmpty ? File(imagePath.value) : null);

      isLoading.value = false;

      update();

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.NAVBAR + Routes.IMAGE_BANNER);
        Get.snackbar("Add Slider Banner", "Slider Banner added successfully!");
      } else {
        Get.snackbar("Error", "Failed to add Slider Banner");
      }
      update();
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }
}
