import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import 'package:tedikap_admin/app/api/order/order_service.dart';
import 'package:tedikap_admin/app/data/model/order/order_response.dart';

import '../../../data/model/order/order items/order_item_model.dart';
import '../../../data/model/order/order items/order_reward_item.dart';
import '../../../data/model/order/order_model.dart';

class OrderStatusController extends GetxController {

  RxBool isLoading = false.obs;
  late OrderService orderService;
  late OrderResponse orderResponse;
  RxList<Orders> takenOrderResponseModel = <Orders>[].obs;


  RxString? status = ''.obs;
  RxString? id = ''.obs;
  RxInt? userId = 0.obs;
  RxInt? cartId = 0.obs;
  RxString? name = ''.obs;
  RxString? avatar = ''.obs;
  RxInt? voucherId = 0.obs;
  RxInt? totalPrice = 0.obs;
  RxInt? discountAmount = 0.obs;
  RxInt? rewardPoint = 0.obs;
  RxInt? originalPrice = 0.obs;
  RxString? createdAt = ''.obs;
  RxString? updatedAt = ''.obs;
  RxString? schedulePickup = ''.obs;
  RxList<OrderItems>? orderItems = <OrderItems>[].obs;
  RxString? paymentChannel = ''.obs;
  RxList<OrderRewardItems>? orderRewardItems = <OrderRewardItems>[].obs;
  RxString? whatsappUser = ''.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("CHECK ARGUMENT");
    print(Get. arguments);
    orderService = OrderService();
    orderResponse = OrderResponse();

    if (Get.arguments is Map<String, dynamic> ) {
      final arguments = Get.arguments as Map<String, dynamic>;

      status?.value = arguments['status'];
      id?.value = arguments['id'];
      userId?.value = arguments['userId'];
      cartId?.value = arguments['cartId'];
      name?.value = arguments['name'];
      avatar?.value = arguments['avatar'];
      voucherId?.value = arguments['voucherId'] ?? 0;
      totalPrice?.value = arguments['totalPrice'] ?? 0;
      discountAmount?.value = arguments['discountAmount'] ?? 0;
      rewardPoint?.value = arguments['rewardPoint'] ?? 0;
      originalPrice?.value = arguments['originalPrice'] ?? 0;
      createdAt?.value = arguments['createdAt'];
      updatedAt?.value = arguments['updatedAt'];
      schedulePickup?.value = arguments['schedulePickup'];
      paymentChannel?.value = arguments['paymentChannel'];
      whatsappUser?.value = arguments['whatsappUser'];
      orderItems?.value = arguments['orderItems']?? [];
      orderRewardItems?.value = arguments['orderRewardItems'] ?? [];

        print("CHECK SETTER VARIABLE VALUE");
        print(status);
      }

      if (Get.arguments is String) {
        print("CHECK ARGUMENT INSIDE STRING CONDITION");
        print(Get.arguments);
        getOrdersByStatusTaken(null);
      }

  }

  Future<void> getOrdersByStatusTaken(int? session) async {
    try {
      print("CHECK SESSION QR Testing Start");

      isLoading.value = true;
      final response = await orderService.getOrdersByStatus('taken', session: session);
      print("CHECK SESSION QR Testing 2");

      orderResponse = OrderResponse.fromJson(response.data);

      print("CHECK SESSION QR Testing 3");

      takenOrderResponseModel.value = orderResponse.orders ?? [];

      print("CHECK SESSION QR Testing");
      print(takenOrderResponseModel);

      for (var i = 0; i < takenOrderResponseModel.length; i++) {
        print("List Order: $i");
        print(takenOrderResponseModel[i].schedulePickup);
        print(takenOrderResponseModel[i].status);
      }
      print("Taken Order: ${takenOrderResponseModel.length}");

      id?.value = Get.arguments ?? "";

      Orders? order = takenOrderResponseModel.firstWhere((order) => order.id == id?.value);

      print("Selected filter order");
      print(order.name);
      print(order.status);

      if(order != null) {
        status?.value = order.status ?? "";
        id?.value = order.id ?? "";
        userId?.value = order.userId ?? 0;
        cartId?.value = order.cartId ?? 0;
        name?.value = order.name ?? "";
        avatar?.value = order.avatar ?? "";
        voucherId?.value = order.voucherId ?? 0;
        totalPrice?.value = order.totalPrice ?? 0;
        discountAmount?.value = order.discountAmount ?? 0;
        rewardPoint?.value = order.rewardPoint ?? 0;
        originalPrice?.value = order.originalPrice ?? 0;
        createdAt?.value = order.createdAt ?? "";
        updatedAt?.value = order.updatedAt ?? "";
        schedulePickup?.value = order.schedulePickup ?? "";
        paymentChannel?.value = order.paymentChannel ?? "";
        whatsappUser?.value = order.whatsappUser ?? "";
        orderItems?.value = order.orderItems ?? [];
        orderRewardItems?.value = order.orderRewardItems ?? [];
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
