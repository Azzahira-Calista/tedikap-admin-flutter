import 'package:get/get.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../api/dio_instance.dart';
import '../../../api/product/product_service.dart';
import '../../../data/model/product/data_model.dart';
import '../../../data/model/product/product_response.dart';

class DetailMenuController extends GetxController {
  late final int id;

  RxBool isLoading = false.obs;
  late ProductService productService;
  late ProductResponse productResponse;

  var productResponseModel = <Data>[].obs;

  DioInstance instance = DioInstance();

  @override
  void onInit() {
    super.onInit();
    // Initialize productService
    productService = ProductService();

    if (Get.arguments != null && Get.arguments.containsKey('id')) {
      id = Get.arguments['id'] as int;
      loadData();
    } else {
      Get.snackbar("Error", "No ID found in arguments");
      Get.back();
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

  Future<void> deleteProduct() async {
    try {
      isLoading.value = true;
      final response = await productService.deleteProduct(id);
      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Delete product", "Product deleted successfully!");
      Get.toNamed(Routes.NAVBAR + Routes.MENU);
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }
}
