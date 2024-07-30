import 'package:get/get.dart';
import '../../../api/order/order_service.dart';
import '../../../data/model/order/order_model.dart';
import '../../../data/model/order/order_response.dart';

class HistoryController extends GetxController {
  RxBool isLoading = false.obs;
  late OrderService orderService;
  late OrderResponse orderResponse;
  RxList<Orders> orderResponseModel = <Orders>[].obs;
  RxString selectrdTab = 'common'.obs;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    orderService = OrderService();
    getHistoryOrder();
  }

  Future<void> getHistoryOrder() async {
    try {
      isLoading.value = true;
      final response = await orderService.getHistoryOrderByType('');
      orderResponse = OrderResponse.fromJson(response.data);
      orderResponseModel.value = orderResponse.orders ?? [];
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getHistoryOrderReward() async {
    try {
      isLoading.value = true;
      final response = await orderService.getHistoryOrderByType('-reward');
      orderResponse = OrderResponse.fromJson(response.data);
      orderResponseModel.value = orderResponse.orders ?? [];
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    if (index == 0) {
      selectrdTab.value = 'common';
      getHistoryOrder();
    } else if (index == 1) {
      selectrdTab.value = 'reward';
      getHistoryOrderReward();
    }
  }
}
