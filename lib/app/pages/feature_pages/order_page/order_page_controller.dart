import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:tedikap_admin/app/api/order/order_service.dart';
import 'package:tedikap_admin/app/data/model/order/order_model.dart';
import 'package:tedikap_admin/app/data/model/order/order_response.dart';

class OrderController extends GetxController {
  RxBool isLoading = false.obs;
  late OrderService orderService;
  late OrderResponse orderResponse;
  RxList<Orders> orderResponseModel = <Orders>[].obs;

  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    orderService = OrderService();
    getHistoryOrder();
  }

  // Future<void> getHistoryOrder() async {
  //   try {
  //     isLoading.value = true;

  //     final response = await orderService.getHistoryOrders();

  //     orderResponse = OrderResponse.fromJson(response.data);
  //     orderResponseModel = orderResponse.orders!.obs;

  //     print("orderResponseModel: ");
  //     print(orderResponseModel);
  //   } catch (e) {
  //     isLoading.value = true;
  //     print(e);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> getHistoryOrder() async {
    try {
      isLoading.value = true;

      final response = await orderService.getHistoryOrders();

      print("API Response: ${response.data}");

      OrderResponse orderResponse = OrderResponse.fromJson(response.data);
      orderResponseModel.value = orderResponse.orders ?? [];

      print("Order Response Model: ${orderResponseModel}");
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
