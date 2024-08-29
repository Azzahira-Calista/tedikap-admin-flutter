
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../../../routes/AppPages.dart';
import '../../../api/promo/promo_service.dart';
import '../../../data/model/data_helper.dart';
import '../../../data/model/product/data_model.dart';
import '../../../data/model/promo/promo_response.dart';

class EditVoucherController extends GetxController {
  late final int id;
  Rx<File?> selectedImage = Rx<File?>(null);
  RxBool isLoading = false.obs;
  PromoService promoService = PromoService();
  late PromoResponse promoResponse;
  var promoResponseModel = <Data>[].obs;
  var startDateApiFormat = ''.obs;
  var endDateApiFormat = ''.obs;

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController discountController;
  late TextEditingController maxDiscountController;
  late TextEditingController minTransactionController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;

  late String imageUrl;
  final RxString imagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();

    final Map<String, dynamic> arguments = Get.arguments;
    id = arguments['id'];

    titleController = TextEditingController(text: arguments['title']);
    descriptionController =
        TextEditingController(text: arguments['description']);
    discountController =
        TextEditingController(text: arguments['discount'].toString());
    maxDiscountController =
        TextEditingController(text: arguments['max_discount'].toString());
    minTransactionController =
        TextEditingController(text: arguments['min_transaction'].toString());
    imageUrl = arguments['image'];

    String startDateApi = arguments['start_date'];
    String endDateApi = arguments['end_date'];

    final DateFormat apiDateFormat = DateFormat('yyyy-MM-dd');
    final DateFormat uiDateFormat = DateFormat('yyyy MMM dd');

    try {
      DateTime startDate = apiDateFormat.parse(startDateApi);
      DateTime endDate = apiDateFormat.parse(endDateApi);

      startDateController =
          TextEditingController(text: uiDateFormat.format(startDate));
      endDateController =
          TextEditingController(text: uiDateFormat.format(endDate));

      startDateApiFormat.value = startDateApi;
      endDateApiFormat.value = endDateApi;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void setImagePath(String path) {
    imagePath.value = path;
    update();
  }

  void setImage(XFile? image) {
    if (image != null) {
      selectedImage.value = File(image.path);
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

  Future<void> deleteVoucher() async {
    try {
      isLoading.value = true;
      await promoService.deletePromo(id);

      isLoading.value = false;
      Get.snackbar("Delete voucher", "Voucher deleted successfully!");
      Get.offAndToNamed(Routes.NAVBAR + Routes.VOUCHER_VIEW);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> editVoucher() async {
    try {
      isLoading.value = true;

      int discount = int.tryParse(discountController.text) ?? 0;
      int maxDiscount = int.tryParse(maxDiscountController.text) ?? 0;
      int minTransaction = int.tryParse(minTransactionController.text) ?? 0;

     
      final response = await promoService.updatePromo(
        id: id,
        title: titleController.text,
        description: descriptionController.text,
        discount: discount,
        maxDiscount: maxDiscount,
        minTransaction: minTransaction,
        startDate: startDateApiFormat.value,
        endDate: endDateApiFormat.value,
        imageFile: selectedImage.value,
      );

      isLoading.value = false;
      update();

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['data'] is List) {
          promoResponseModel.value = DataHelper.parseJsonList<Data>(
              response.data['data'], (json) => Data.fromJson(json));
        } else if (response.data['data'] is Map<String, dynamic>) {
          var parsedData = DataHelper.parseJson<Data>(
              response.data['data'], (json) => Data.fromJson(json));
          promoResponseModel.value = [parsedData];
        }

        Get.offAndToNamed(Routes.NAVBAR + Routes.CRUD_PAGE);
        Get.snackbar("Edit voucher", "Voucher edited successfully!");
      } else {
        Get.snackbar("Error", "Failed to edit voucher");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}
