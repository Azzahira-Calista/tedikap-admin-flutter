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
    id = Get.arguments['id'] as int;
    loadData();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print("bismillah: $id");
    super.onReady();
  }

  void loadData() async {
    // Simulate data loading
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  Future<void> deleteProduct() async {
    try {
      isLoading.value = true;
      final response = await productService.deleteProduct(id);
      print("Response: $response");

      Get.toNamed(Routes.NAVBAR + Routes.MENU);
      Get.snackbar("Delete product", "Product deleted successfully!");
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }

    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }
}
