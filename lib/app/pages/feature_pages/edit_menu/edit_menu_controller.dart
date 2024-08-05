import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/routes/AppPages.dart';
import '../../../api/dio_instance.dart';
import '../../../api/product/product_service.dart';
import '../../../data/model/product/data_model.dart';
import '../../../data/model/product/product_response.dart';

class EditMenuController extends GetxController {
  late final int id;
  Rx<File?> selectedImage = Rx<File?>(null);

  RxBool isLoading = false.obs;
  late ProductService productService;
  late ProductResponse productResponse;

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

    productService = ProductService();
    // if (Get.arguments != null && Get.arguments.containsKey('id')) {
    //   id = Get.arguments['id'];
    //   loadData();
    // } else {
    //   Get.snackbar("Error", "No ID found in arguments");
    //   Get.back();
    // }
    final Map<String, dynamic> arguments = Get.arguments;
    id = arguments['id'];
    print(id);
    loadData();
    nameController = TextEditingController(text: arguments['name']);
    descriptionController =
        TextEditingController(text: arguments['description']);
    categoryController = TextEditingController(text: arguments['category']);
    // selectedCategory.value = arguments['category'] ?? '';
    regularPriceController =
        TextEditingController(text: arguments['regular_price'].toString());
    largePriceController =
        TextEditingController(text: arguments['large_price'].toString());
    imageUrl = arguments['image'];
  }

  void setImage(XFile? image) {
    if (image != null) {
      selectedImage.value = File(image.path);
      print("New image selected: ${selectedImage.value!.path}");
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

  Future<void> editProduct() async {
    try {
      isLoading.value = true;

      // Parse text inputs to integers
      int regularPrice = int.tryParse(regularPriceController.text) ?? 0;
      int largePrice = int.tryParse(largePriceController.text) ?? 0;

      final response = await productService.updateProduct(
        id: id,
        name: nameController.text,
        description: descriptionController.text,
        category: categoryController.text,
        regularPrice: regularPrice,
        largePrice: largePrice,
        imageFile: selectedImage.value,
      );

      isLoading.value = false;

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.NAVBAR + Routes.MENU);
        Get.snackbar("Edit product", "Product edited successfully!");
      } else {
        // Handle other status codes
        print("Response status code: ${response.statusCode}");
        Get.snackbar("Error", "Failed to edit product: ${response.data}");
      }
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
      throw Exception(e);
    }
  }
}
