import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_admin/app/api/product/product_service.dart';
import 'package:tedikap_admin/app/api/promo/promo_service.dart';
import 'package:tedikap_admin/app/data/model/promo/promo_model.dart';
import 'package:tedikap_admin/app/data/model/promo/promo_response.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../data/model/product/data_model.dart';

class TambahPromoController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<int> selectedProductId = Rxn<int>();

  PromoService promoService = PromoService();
  late PromoResponse promoResponse;
  var promoResponseModel = <Promo>[].obs;
  var startDateApiFormat = ''.obs;
  var endDateApiFormat = ''.obs;
  RxString selectedPriceType = 'large'.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController productIdController = TextEditingController();
  // TextEditingController priceTypeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    if (args != null && args['selectedProductId'] != null) {
      selectedProductId.value = args['selectedProductId'];
      productIdController.text = selectedProductId.value.toString(); // Set the product ID in the TextEditingController
    }
    print('Selected Product ID: ${selectedProductId.value}');
  }

  Future<void> addPromo() async {
    print('Title: ${titleController.text}');
    print('Description: ${descriptionController.text}');
    print('Discount: ${discountController.text}');
    print('Start Date: ${startDateController.text}');
    print('End Date: ${endDateController.text}');
    print('Product ID: ${productIdController.text}');
    // print('Price Type: ${priceTypeController.text}');

    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        discountController.text.isEmpty ||
        startDateController.text.isEmpty ||
        endDateController.text.isEmpty ||
        productIdController.text.isEmpty
        // priceTypeController.text.isEmpty
    ) {
      Get.snackbar("Error", "All fields must be filled");
      return;
    }
    print('Selected Product ID: ${selectedProductId.value}');

    try {
      isLoading(true);
      await promoService.storePromo(
        title: titleController.text,
        description: descriptionController.text,
        discount: int.parse(discountController.text),
        startDate: startDateApiFormat.value,
        endDate: endDateApiFormat.value,
        priceType: selectedPriceType.value,
        productId: selectedProductId.value != null ? [selectedProductId.value!] : [],
      );
      Get.offAndToNamed(Routes.NAVBAR + Routes.CRUD_PAGE);
      // Get.offNamedUntil(Routes.NAVBAR + Routes.PROMO_PAGE, (routes) => routes.settings.name == Routes.PROMO_PAGE);
      Get.snackbar("Add promo", "Promo added successfully!");

    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  // Future<void> selectDate(
  //     BuildContext context, TextEditingController controller) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2050),
  //   );
  //
  //   if (pickedDate != null) {
  //     controller.text = DateFormat('yyyy MMM dd').format(pickedDate);
  //
  //     final apiDateFormat = DateFormat('yyyy-MM-dd');
  //     final apiFormattedDate = apiDateFormat.format(pickedDate);
  //
  //     if (controller == startDateController) {
  //       startDateApiFormat.value = apiFormattedDate;
  //     } else if (controller == endDateController) {
  //       endDateApiFormat.value = apiFormattedDate;
  //     }
  //   }
  // }
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );

    print('Picked Date: $pickedDate');

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
