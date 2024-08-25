import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/api/box%20promo/box_promo_service.dart';

import '../../../../routes/AppPages.dart';
import '../../../data/model/box promo/box_promo_model.dart';
import '../../../data/model/box promo/box_promo_response.dart';

class TambahBoxPromoController extends GetxController {
  RxString imagePath = ''.obs;
  RxBool isLoading = false.obs;

  BoxPromoService boxPromoService = BoxPromoService();
  late BoxPromoResponse boxPromoResponse;
  var boxPromoResponseModel = <Data>[].obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

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

  Future<void> addBoxPromo() async {
  if (titleController.text.isEmpty || subTitleController.text.isEmpty || imagePath.value.isEmpty) {
    Get.snackbar("Error", "All fields must be filled");
    return;
  }

  try {
    isLoading.value = true;

    final response = await boxPromoService.storeBoxPromo(
      title: titleController.text,
      subtitle: subTitleController.text,
      image: imagePath.value.isNotEmpty ? File(imagePath.value) : null,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.offAndToNamed(Routes.NAVBAR + Routes.BOX_PROMO);
      Get.snackbar("Add Box Promo", "Box Promo added successfully!");
    } else {
      Get.snackbar("Error", "Failed to add Box Promo");
    }
  } catch (e) {
    Get.snackbar("Error", "An error occurred: $e");
  } finally {
    isLoading.value = false;
    update();
  }
}

}
