import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/data/model/voucher/voucher_response.dart';

import '../../../../routes/AppPages.dart';
import 'package:intl/intl.dart';

import '../../../api/voucher/voucher_service.dart';
import '../../../data/model/voucher/voucher_model.dart';

class TambahVoucherController extends GetxController {
  RxString imagePath = ''.obs;
  RxBool isLoading = false.obs;
  VoucherService voucherService = VoucherService();
  late VoucherResponse voucherResponse;
  var voucherResponseModel = <Data>[].obs;
  var startDateApiFormat = ''.obs;
  var endDateApiFormat = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController maxDiscountController = TextEditingController();
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

  Future<void> addVoucher() async {
    if (nameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        discountController.text.isEmpty ||
        maxDiscountController.text.isEmpty ||
        minTransactionController.text.isEmpty ||
        endDateController.text.isEmpty ||
        imagePath.value.isEmpty) {
      Get.snackbar("Error", "All fields must be filled");
      return;
    }
    if (int.tryParse(discountController.text)! > 100) {
      Get.snackbar("Error", "Discount cannot be more than 100");
      return;
    }

    try {
      isLoading.value = true;

      int discount = int.tryParse(discountController.text) ?? 0;
      int maxDiscount = int.tryParse(maxDiscountController.text) ?? 0;
      int minTransaction = int.tryParse(minTransactionController.text) ?? 0;

      final response = await voucherService.storeVoucher(
          title: nameController.text,
          description: descriptionController.text,
          discount: discount,
          maxDiscount: maxDiscount,
          minTransaction: minTransaction,
          startDate: startDateApiFormat.value,
          endDate: endDateApiFormat.value,
          imageFile: imagePath.value.isNotEmpty ? File(imagePath.value) : null);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.offAndToNamed(Routes.NAVBAR + Routes.CRUD_PAGE);
        Get.snackbar("Add voucher", "Voucher added successfully!");
      } else {
        Get.snackbar("Error", "Failed to add product");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      controller.text = DateFormat('yyyy MMM dd').format(pickedDate);

      final apiDateFormat = DateFormat('yyyy-MM-dd');
      final apiFormattedDate = apiDateFormat.format(pickedDate);

      if (controller == startDateController) {
        startDateApiFormat.value = apiFormattedDate;
      } else if (controller == endDateController) {
        endDateApiFormat.value = apiFormattedDate;
      }
    }
  }
}
