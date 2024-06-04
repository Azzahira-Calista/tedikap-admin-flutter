// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/api/product/product_service.dart';
import 'package:tedikap_admin/app/data/model/product/data_model.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../data/model/product/product_response.dart';

class TambahMenuController extends GetxController {
  RxString imagePath = "".obs;
  ProductService productService = ProductService();
  late ProductResponse productResponse;
  var productResponseModel = <Data>[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descrptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  RxBool isLoading = false.obs;

  // Rx<Data> arguments = Get.arguments;

  Future<dio.Response> addProduct() async {
    try {
      isLoading.value = true;

      dio.FormData formData = dio.FormData.fromMap({
        "name": nameController.text,
        "category": categoryController.text,
        "description": descrptionController.text,
        "price": priceController.text,
        "image": await dio.MultipartFile.fromFile(imagePath.value),
      });

      print("FormData: $formData");

      final response = await productService.storeProduct(formData);

      productResponseModel.add(Data.fromJson(response.data['data']));
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

  Future<void> pickImage(RxString imagePath) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imagePath.value = pickedImage.path;
    }
  }
}
