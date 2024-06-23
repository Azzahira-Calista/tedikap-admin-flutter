// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/api/product/product_service.dart';
import 'package:tedikap_admin/app/data/model/product/data_model.dart';
import 'package:tedikap_admin/routes/AppPages.dart';
import 'dart:io' as i;

import '../../../data/model/product/product_response.dart';

class TambahMenuController extends GetxController {
  RxString imagePath = ''.obs;
  ProductService productService = ProductService();
  late ProductResponse productResponse;
  var productResponseModel = <Data>[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descrptionController = TextEditingController();
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

  Future<dio.Response> addProduct() async {
    try {
      isLoading.value = true;


      final response = await productService.storeProduct(
        name: nameController.text,
        description: descrptionController.text,
        category: categoryController.text,
        regularPrice: regularPriceController.text,
        largePrice: largePriceController.text,
        imageFile: imagePath.value.isNotEmpty ? File(imagePath.value) : null
      );

      // productResponseModel.add(Data.fromJson(response.data['data']));
      isLoading.value = false;

      update();

      if (response != null && response.statusCode == 200) {
        Get.toNamed(Routes.NAVBAR + Routes.MENU);
        Get.snackbar("Add product", "Product added successfully!");
      } else {
        Get.snackbar("Error", "Failed to add product");
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
