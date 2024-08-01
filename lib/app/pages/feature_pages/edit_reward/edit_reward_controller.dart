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
  late TextEditingController regularPointController;
  late TextEditingController largePointController;

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
    categoryController = TextEditingController(text: arguments['category']);
    // selectedCategory.value = arguments['category'] ?? '';
    regularPointController =
        TextEditingController(text: arguments['regularPoint'].toString());
    largePointController =
        TextEditingController(text: arguments['largePoint'].toString());
    // regularPointController = TextEditingController(text: arguments['regular_point']);
    // largePointController = TextEditingController(text: arguments['large_point']);

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
      int regularPoint = int.tryParse(regularPointController.text) ?? 0;
      int largePoint = int.tryParse(largePointController.text) ?? 0;

      final response = await rewardService.updateReward(
        id: id,
        name: nameController.text,
        description: descriptionController.text,
        category: categoryController.text,
        // category: selectedCategory.value,
        // regularPrice: regularPrice,
        // largePrice: largePrice,
        regularPoint: regularPoint,
        largePoint: largePoint,
        imageFile: null,
      );

      isLoading.value = false;

      update();

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.NAVBAR);
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
