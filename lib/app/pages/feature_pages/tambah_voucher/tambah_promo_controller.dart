import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/api/promo/promo_service.dart';
import 'package:tedikap_admin/app/data/model/promo/promo_response.dart';

import '../../../../routes/AppPages.dart';
import '../../../data/model/product/data_model.dart';

class TambahPromoController extends GetxController {
  RxString imagePath = ''.obs;
  RxBool isLoading = false.obs;

  PromoService promoService = PromoService();
  late PromoResponse promoResponse;
  var promoResponseModel = <Data>[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  // TextEditingController maxDiscountController = TextEditingController();
  TextEditingController minTransactionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

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

  Future<dio.Response> addPromo() async {
    try {
      isLoading.value = true;

      final response = await promoService.storePromo(
        name: nameController.text,
        description: descriptionController.text,
        discount: discountController.text,
        // maxDiscount: maxDiscountController.text,
        minTransaction: minTransactionController.text,
        startDate: startDateController.text,
        endDate: endDateController.text,
        imageFile: imagePath.value.isNotEmpty ? File(imagePath.value) : null
      );
      
      isLoading.value = false;

      update();

      if (response.statusCode == 200) {
        Get.toNamed(Routes.NAVBAR + Routes.MENU);
        Get.snackbar("Add voucher", "Voucher added successfully!");
      } else {
        Get.snackbar("Error", "Failed to add product");
      }
      return response;
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }
}