import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'dart:io';

import '../../../../routes/AppPages.dart';
import '../../../api/promo/promo_service.dart';
import '../../../data/model/product/data_model.dart';
import '../../../data/model/promo/promo_response.dart';

class EditVoucherController extends GetxController {
  late final int id;
  RxString imagePath = ''.obs;
  RxBool isLoading = false.obs;
  PromoService promoService = PromoService();
  late PromoResponse promoResponse;

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController discountController;
  late TextEditingController minTransactionController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;

  late String imageUrl;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null && Get.arguments.containsKey('id')) {
      id = Get.arguments['id'] as int;
      loadData();
    } else {
      Get.snackbar("Error", "No ID found in arguments");
      Get.back();
    }

    final Map<String, dynamic> arguments = Get.arguments;
    titleController = TextEditingController(text: arguments['title'] ?? '');
    descriptionController = TextEditingController(text: arguments['description'] ?? '');
    discountController = TextEditingController(text: arguments['discount'].toString() ?? '');
    minTransactionController = TextEditingController(text: arguments['min_transaction'].toString() ?? '');
    startDateController = TextEditingController(text: arguments['start_date'] ?? '');
    endDateController = TextEditingController(text: arguments['end_date'] ?? '');
    imageUrl = arguments['image'] ?? '';

    print("Title: ${titleController.text}");
    print("Description: ${descriptionController.text}");
    print("Discount: ${discountController.text}");
    print("Min Transaction: ${minTransactionController.text}");
    print("Start Date: ${startDateController.text}");
    print("End Date: ${endDateController.text}");
    print("Image Path: ${imagePath.value}");
    print("Image URL: $imageUrl");
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

  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  Future<void> deleteVoucher() async {
    try {
      isLoading.value = true;
      final response = await promoService.deletePromo(id);
      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Delete voucher", "Voucher deleted successfully!");
      Get.toNamed(Routes.NAVBAR + Routes.PROMO_VIEW);
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }

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

  Future<void> updateVoucher() async {
    try {
      isLoading.value = true;

      // Ensure the form controllers are up-to-date
      final title = titleController.text;
      final description = descriptionController.text;
      final discount = discountController.text;
      final minTransaction = minTransactionController.text;
      final startDate = startDateController.text;
      final endDate = endDateController.text;
      final imageFile = imagePath.value.isNotEmpty ? File(imagePath.value) : null;

      print("Updating voucher with:");
      print("Title: $title");
      print("Description: $description");
      print("Discount: $discount");
      print("Min Transaction: $minTransaction");
      print("Start Date: $startDate");
      print("End Date: $endDate");
      print("Image Path: ${imageFile?.path ?? 'No new image'}");

      final response = await promoService.updatePromo(
        id: id,
        name: title,
        description: description,
        discount: discount,
        endDate: endDate,
        minTransaction: minTransaction,
        startDate: startDate,
        imageFile: imageFile,
      );

      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Update voucher", "Voucher updated successfully!");
      Get.toNamed(Routes.NAVBAR + Routes.PROMO_VIEW);
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }
}
