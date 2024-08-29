import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../routes/AppPages.dart';
import '../../../data/model/box promo/box_promo_response.dart';
import '../../../data/model/promo/promo_model.dart';
import '../../../api/box promo/box_promo_service.dart';

class EditBoxPromoController extends GetxController {
  late final int id;
  RxBool isLoading = false.obs;
  BoxPromoService boxPromoService = BoxPromoService();
  late BoxPromoResponse boxPromoResponse;
  var boxPromoResponseModel = <Data>[].obs;
    Rx<File?> selectedImage = Rx<File?>(null);


  late TextEditingController titleController;
  late TextEditingController subTitleController;
  late String imageUrl;
  final RxString imagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null && arguments is Map<String, dynamic> && arguments.containsKey('id')) {
      id = arguments['id'] as int;
      titleController = TextEditingController(text: arguments['title'] ?? '');
      subTitleController = TextEditingController(text: arguments['subtitle'] ?? '');
      imageUrl = arguments['image'] ?? '';
      loadData();
    } else {
      Get.snackbar("Error", "No ID found in arguments");
      Get.back();
    }
  }

   void setImage(XFile? image) {
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void loadData() async {
    isLoading.value = true;
    try {
      // Simulate data loading
      await Future.delayed(const Duration(seconds: 2));
      // Here you can fetch data from the server using the `id`
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to load data");
    }
  }

  Future<void> deleteBoxPromo() async {
    try {
      isLoading.value = true;
     await boxPromoService.deleteBoxPromo(id: id);

      isLoading.value = false;
      Get.snackbar("Delete box promo", "Box promo deleted successfully!");
      Get.offAndToNamed(Routes.NAVBAR + Routes.BOX_PROMO);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> editBoxPromo() async {
    if (titleController.text.isEmpty || subTitleController.text.isEmpty) {
      Get.snackbar("Error", "All fields must be filled");
      return;
    }

    try {
      isLoading.value = true;

      final response = await boxPromoService.updateBoxPromo(
        id: id,
        title: titleController.text,
        subtitle: subTitleController.text,
        image: selectedImage.value,
      );

      isLoading.value = false;

      update();

      if (response.statusCode == 200) {
        Get.offAndToNamed(Routes.NAVBAR + Routes.BOX_PROMO);
        Get.snackbar("Edit box promo", "Box promo edited successfully!");
      } else {
        Get.snackbar("Error", "Failed to edit box promo");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}
