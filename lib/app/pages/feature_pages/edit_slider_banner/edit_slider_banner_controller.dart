import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/api/image%20banner/banner_service.dart';
import 'package:tedikap_admin/app/data/model/image%20slider%20banner/image_slider_response.dart';

import '../../../../routes/AppPages.dart';
import '../../../data/model/data_helper.dart';
import '../../../data/model/image slider banner/image_slider_model.dart';

class EditSliderBannerController extends GetxController{
  late final int id;
  RxBool isLoading = false.obs;
  ImageSliderService imageSliderService = ImageSliderService();
  late SliderBannerResponse imageSliderResponse;
  var imageSliderResponseModel = <Data>[].obs;

  late String imageUrl;
  final RxString imagePath = ''.obs;

   @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null && arguments is Map<String, dynamic> && arguments.containsKey('id')) {
      id = arguments['id'] as int;
      imageUrl = arguments['image'] ?? '';
      loadData();
    } else {
      Get.snackbar("Error", "No ID found in arguments");
      Get.back();
    }
  }

  void setImagePath(String path) {
    imagePath.value = path;
    update();
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setImagePath(pickedFile.path);
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

    Future<void> deleteImageBanner() async {
    try {
      isLoading.value = true;
      final response = await imageSliderService.deleteImageBanner(id: id);
      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Delete image banner", "Image banner deleted successfully!");
      Get.toNamed(Routes.NAVBAR + Routes.IMAGE_BANNER);
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> editImageBanner() async {
    try {
      isLoading.value = true;
      final response = await imageSliderService.updateaImageBanner(
        id: id,
        image: imagePath.value.isNotEmpty ? File(imagePath.value) : null,
      );
      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Update image banner", "Image banner updated successfully!");
      Get.toNamed(Routes.NAVBAR + Routes.IMAGE_BANNER);
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }
}