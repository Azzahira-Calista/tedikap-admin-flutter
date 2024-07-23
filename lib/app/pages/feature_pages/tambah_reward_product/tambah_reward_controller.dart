// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/api/reward/reward_service.dart';
import 'package:tedikap_admin/app/data/model/reward/reward_model.dart';

import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../data/model/product/product_response.dart';

class TambahRewardController extends GetxController {
  RxString imagePath = ''.obs;
  RewardService rewardService = RewardService();
  late ProductResponse productResponse;
  var productResponseModel = <Data>[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController largePointController = TextEditingController();
  TextEditingController regularPointController = TextEditingController();

  RxBool isLoading = false.obs;

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

  // Rx<Data> arguments = Get.arguments;

  // Future<dio.Response> addProduct() async {
  //   try {
  //     isLoading.value = true;

  //      // Parse text inputs to integers
  //   int regularPoint = int.tryParse(regularPointController.text) ?? 0;
  //   int largePoint = int.tryParse(largePointController.text) ?? 0;

  //     final response = await rewardService.storeReward(
  //       name: nameController.text,
  //       description: descriptionController.text,
  //       category: categoryController.text,
  //       regularPoint: regularPoint,
  //       largePoint: largePoint,
  //       imageFile: imagePath.value.isNotEmpty ? File(imagePath.value) : null
  //     );

  //     print('ini add response $response');
  //     print('ini  response image ${imagePath.value}');

  //     // productResponseModel.add(Data.fromJson(response.data['data']));
  //     isLoading.value = false;

  //     update();

  //     if (response.statusCode == 200) {
  //       Get.toNamed(Routes.NAVBAR + Routes.MENU);
  //       Get.snackbar("Add reward product", "Reward added successfully!");
  //     } else {
  //       Get.snackbar("Error", "Failed to add reward");
  //     }

  //     return response;
  //   } catch (e) {
  //     isLoading.value = false;
  //     print("Error: $e");
  //     Get.snackbar("Error", e.toString());
  //     throw Exception(e);
  //   }
  // }
  Future<dio.Response> addProduct() async {
    try {
      isLoading.value = true;

      // Parse text inputs to integers
      int regularPoint = int.tryParse(regularPointController.text) ?? 0;
      int largePoint = int.tryParse(largePointController.text) ?? 0;

      final response = await rewardService.storeReward(
        name: nameController.text,
        description: descriptionController.text,
        category: categoryController.text,
        regularPoint: regularPoint,
        largePoint: largePoint,
        imageFile: imagePath.value.isNotEmpty ? File(imagePath.value) : null,
      );

      print('Response: $response');
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
      print('Response image path: ${imagePath.value}');

      isLoading.value = false;

      update();

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Add reward product", "Reward added successfully!");
        Get.toNamed(Routes.NAVBAR + Routes.MENU);
      } else {
        Get.snackbar("Error", "Failed to add reward");
      }

      return response;
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
      throw Exception(e);
    }
  }
}
