import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/reward/reward_service.dart';
import 'package:tedikap_admin/app/data/model/reward/reward_model.dart';
import 'package:tedikap_admin/app/data/model/reward/reward_response.dart';
import 'package:tedikap_admin/routes/AppPages.dart';
import '../../../api/dio_instance.dart';

class EditRewardController extends GetxController {
  late final int id;

  RxBool isLoading = false.obs;
  late RewardService rewardService;
  late RewardResponse rewardResponse;

  var productResponseModel = <Data>[].obs;

  DioInstance instance = DioInstance();

  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController categoryController;
  late TextEditingController regularPriceController;
  late TextEditingController largePriceController;

  // RxString selectedCategory = ''.obs;

  // final List<String> categories = ['tea', 'nontea', 'snack'];

  late String imageUrl;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    rewardService = RewardService();
    if (Get.arguments != null && Get.arguments.containsKey('id')) {
      id = Get.arguments['id'] as int;
      loadData();
    } else {
      Get.snackbar("Error", "No ID found in arguments");
      Get.back();
    }

    final Map<String, dynamic> arguments = Get.arguments;
    nameController = TextEditingController(text: arguments['name']);
    descriptionController =
        TextEditingController(text: arguments['description']);
    categoryController =
        TextEditingController(text: arguments['category'] ?? '');
    // selectedCategory.value = arguments['category'] ?? '';
    regularPriceController =
        TextEditingController(text: arguments['regular_price'].toString());
    largePriceController =
        TextEditingController(text: arguments['large_price'].toString());

    imageUrl = arguments['image'];
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

  Future<void> editProduct() async {
    try {
      isLoading.value = true;

      // Parse text inputs to integers
      int regularPrice = int.tryParse(regularPriceController.text) ?? 0;
      int largePrice = int.tryParse(largePriceController.text) ?? 0;

      final response = await rewardService.updateReward(
        id: id,
        name: nameController.text,
        description: descriptionController.text,
        category: categoryController.text,
        // category: selectedCategory.value,
        regularPrice: regularPrice,
        largePrice: largePrice,
        imageFile: null,
      );

      isLoading.value = false;

      update();

      if (response.statusCode == 200) {
        Get.toNamed(Routes.NAVBAR + Routes.MENU);
        Get.snackbar("Edit reward", "Reward edited successfully!");
      } else {
        print("Response status code: ${response.statusCode}");
        Get.snackbar("Error", "Failed to edit reward: ${response.data}");
      }
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
      throw Exception(e);
    }
  }
}
