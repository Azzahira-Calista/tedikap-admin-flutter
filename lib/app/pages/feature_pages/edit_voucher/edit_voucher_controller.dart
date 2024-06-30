import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../routes/AppPages.dart';
import '../../../api/promo/promo_service.dart';
import '../../../data/model/product/data_model.dart';
import '../../../data/model/promo/promo_response.dart';

class EditVoucherController extends GetxController {
  late final int id;
    RxBool isLoading = false.obs;
PromoService promoService = PromoService();
  late PromoResponse promoResponse;
  var promoResponseModel = <Data>[].obs;

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
    titleController = TextEditingController(text: arguments['title']);
    descriptionController = TextEditingController(text: arguments['description']);
    discountController = TextEditingController(text: arguments['discount'].toString());
    minTransactionController = TextEditingController(text: arguments['min_transaction'].toString());
    startDateController = TextEditingController(text: arguments['start_date']);
    endDateController = TextEditingController(text: arguments['end_date']);
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
}
