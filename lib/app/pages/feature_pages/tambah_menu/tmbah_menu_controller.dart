// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/api/product/product_service.dart';
import 'package:tedikap_admin/app/data/model/product/data_model.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../data/model/product/product_response.dart';

class TambahMenuController extends GetxController {
  RxString imagePath = ''.obs;
  ProductService productService = ProductService();
  late ProductResponse productResponse;
  var productResponseModel = <Data>[].obs;
  RxString selectedCategory = 'tea'.obs;

  TextEditingController nameController = TextEditingController();
  // TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController largePriceController = TextEditingController();
  TextEditingController regularPriceController = TextEditingController();

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

  Future<void> addProduct() async {
    if (nameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        // categoryController.text.isEmpty ||
        selectedCategory.value.isEmpty ||
        regularPriceController.text.isEmpty ||
        largePriceController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    try {
      isLoading.value = true;

      // Parse text inputs to integers
      int regularPrice = int.tryParse(regularPriceController.text) ?? 0;
      int largePrice = int.tryParse(largePriceController.text) ?? 0;

      final response = await productService.storeProduct(
          name: nameController.text,
          description: descriptionController.text,
          // category: categoryController.text,
          category: selectedCategory.value,
          regularPrice: regularPrice,
          largePrice: largePrice,
          imageFile: imagePath.value.isNotEmpty ? File(imagePath.value) : null);

      print('ini add response $response');
      print('ini  response image ${imagePath.value}');

      // productResponseModel.add(Data.fromJson(response.data['data']));
      isLoading.value = false;

      update();

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.offAndToNamed(Routes.NAVBAR + Routes.MENU);
        Get.snackbar("Add product", "Product added successfully!");
      } else {
        Get.snackbar("Error", "Failed to add product");
      }

      // return response;
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }
}
