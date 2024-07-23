import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import 'package:tedikap_admin/app/api/order/order_service.dart';
import 'package:tedikap_admin/app/data/model/order/order_response.dart';

import '../../../data/model/order/order_model.dart';

class OrderStatusController extends GetxController {
  late final int id;

  RxBool isLoading = false.obs;
  late OrderService orderService;
  late OrderResponse orderResponse;
  RxList<Orders> orderResponseModel = <Orders>[].obs;

  DioInstance instance = DioInstance();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    orderService = OrderService();
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
}
