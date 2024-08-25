import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/stok/status_stok_product_service.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../api/dio_instance.dart';
import '../../../api/product/product_service.dart';
import '../../../data/model/product/data_model.dart';
import '../../../data/model/product/product_response.dart';

class DetailMenuController extends GetxController {
  late final int id;
    RxBool isSwitched = false.obs;


  RxBool isLoading = false.obs;
  late ProductService productService;
  late ProductResponse productResponse;
  StatusStockProductService? statusStockProductService;

  var productResponseModel = <Data>[].obs;

  DioInstance instance = DioInstance();

  @override
  void onInit() {
    super.onInit();

    final Map<String, dynamic> arguments = Get.arguments;
    id = arguments['id'];
    print('id brot $id');

    statusStockProductService = StatusStockProductService();
    productService = ProductService();
    isSwitched.value = Get.arguments['stock'] ?? false;
    print("Initial stock status product: ${Get.arguments['stock']}");

    // if (Get.arguments != null && Get.arguments.containsKey('id')) {
    //   id = Get.arguments['id'] as int;
    //   print(id);
    //   loadData();
    // } else {
    //   Get.snackbar("Error", "No ID found in arguments");
    //   Get.back();
    // }
    print('bismillah yaaaa');
    loadData();
  }

  void toggleStockProduct(bool value) async {
    print("toggleStockProduct value: $value");

    isSwitched.value = value;
    if (value) {
      await changeStockAvailable(true);
    } else {
      await changeStockAvailable(false);
    }
  }

  Future<void> changeStockAvailable(bool value) async {
    try {
      isLoading.value = true;
      final response = await statusStockProductService!.updateStockProduct(id, value);
      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Update stock", "Stock updated successfully!");
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
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
      Get.offAndToNamed(Routes.NAVBAR + Routes.MENU);
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }
}
