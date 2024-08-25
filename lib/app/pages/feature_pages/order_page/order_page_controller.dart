import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:tedikap_admin/app/api/order/order_service.dart';
import 'package:tedikap_admin/app/data/model/order/order_model.dart';
import 'package:tedikap_admin/app/data/model/order/order_response.dart';

import '../../../../routes/AppPages.dart';

class OrderController extends GetxController {
  RxBool isLoading = false.obs;
  late OrderService orderService;
  late OrderResponse orderResponse;
  RxList<Orders> newOrderResponseModel = <Orders>[].obs;
  RxList<Orders> processedOrderResponseModel = <Orders>[].obs;
  RxList<Orders> takenOrderResponseModel = <Orders>[].obs;
 

  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    orderService = OrderService();

    getOrdersByStatusNew(null);
    getOrdersByStatusProcessed(null);
    getOrdersByStatusTaken(null);
    super.onInit();
  }

  Future<void> getOrdersByStatusNew(int? session) async {
    try {
      isLoading.value = true;
      final response =
          await orderService.getOrdersByStatus('new order', session: session);
      orderResponse = OrderResponse.fromJson(response.data);
      newOrderResponseModel.value = orderResponse.orders ?? [];
      print("CHECK SESSION");

      for (var i = 0; i < newOrderResponseModel.length; i++) {
        print("List Order: $i");
        print(newOrderResponseModel[i].schedulePickup);
        print(newOrderResponseModel[i].status);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOrdersByStatusProcessed(int? session) async {
    try {
      isLoading.value = true;
      final response =
          await orderService.getOrdersByStatus('proccess', session: session);
      orderResponse = OrderResponse.fromJson(response.data);
      processedOrderResponseModel.value = orderResponse.orders ?? [];
      print("CHECK SESSION");

      for (var i = 0; i < processedOrderResponseModel.length; i++) {
        print("List Order: $i");
        print(processedOrderResponseModel[i].schedulePickup);
        print(processedOrderResponseModel[i].status);
      }

      print(response.data);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOrdersByStatusTaken(int? session) async {
    try {
      isLoading.value = true;
      final response =
          await orderService.getOrdersByStatus('taken', session: session);
      orderResponse = OrderResponse.fromJson(response.data);
      takenOrderResponseModel.value = orderResponse.orders ?? [];

      print("CHECK SESSION");

      for (var i = 0; i < takenOrderResponseModel.length; i++) {
        print("List Order: $i");
        print(takenOrderResponseModel[i].schedulePickup);
        print(takenOrderResponseModel[i].status);
      }
      print("Taken Orders: ${takenOrderResponseModel.length}");
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> acceptOrder(String orderId) async {
    try {
      isLoading.value = true;
      final response = await orderService.acceptanceOrder(orderId, 'accepted');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.NAVBAR + Routes.ORDER);
        Get.snackbar("Order Accepted", "Order has been accepted successfully!");
      } else {
        Get.snackbar("Error", "Failed to accept order");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "An error occurred while accepting the order");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> rejectOrder(String orderId) async {
    try {
      isLoading.value = true;
      final response = await orderService.acceptanceOrder(orderId, 'rejected');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.NAVBAR + Routes.ORDER);
        Get.snackbar("Order Rejected", "Order has been rejected successfully!");
      } else {
        Get.snackbar("Error", "Failed to reject order");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "An error occurred while rejecting the order");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> readyOrder(String orderId) async {
    try {
      isLoading.value = true;
      final response = await orderService.readyOrder(orderId, 'accepted');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.NAVBAR + Routes.ORDER);
        Get.snackbar("Order Ready", "Order is ready for pickup!");
      } else {
        Get.snackbar("Error", "Failed to set order as ready");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar(
          "Error", "An error occurred while setting the order as ready");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> rejectReadyOrder(String orderId) async {
    try {
      isLoading.value = true;
      final response = await orderService.readyOrder(orderId, 'rejected');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.NAVBAR + Routes.ORDER);
        Get.snackbar("Order Rejected", "Order has been rejected successfully!");
      } else {
        Get.snackbar("Error", "Failed to reject order");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "An error occurred while rejecting the order");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> finishOrder(String orderId) async {
    try {
      isLoading.value = true;
      final response = await orderService.finishOrder(orderId, 'accepted');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.NAVBAR + Routes.ORDER);
        Get.snackbar(
            "Order Finished", "Order has been completed successfully!");
      } else {
        Get.snackbar("Error", "Failed to complete order");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "An error occurred while completing the order");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> rejectFinishOrder(String orderId) async {
    try {
      isLoading.value = true;
      final response = await orderService.finishOrder(orderId, 'rejected');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.toNamed(Routes.NAVBAR + Routes.ORDER);
        Get.snackbar("Order Rejected", "Order has been rejected successfully!");
      } else {
        Get.snackbar("Error", "Failed to reject order");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "An error occurred while rejecting the order");
    } finally {
      isLoading.value = false;
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
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  void toggleSession1(String orderStatus, RxBool isCheckedSession1) {
    isCheckedSession1.value = !isCheckedSession1.value;

    if (orderStatus == 'new order') {
      if (isCheckedSession1.value) {
        getOrdersByStatusNew(1);
        print('is checked 1');
      } else {
        getOrdersByStatusNew(null);
        print('is checked 0');
      }
    } else if (orderStatus == 'proccess') {
      if (isCheckedSession1.value) {
        getOrdersByStatusProcessed(1);
      } else {
        getOrdersByStatusProcessed(null);
      }
    } else if (orderStatus == 'taken') {
      if (isCheckedSession1.value) {
        getOrdersByStatusTaken(1);
      } else {
        getOrdersByStatusTaken(null);
      }
    }
  }

  void toggleSession2(String orderStatus, RxBool isCheckedSession2) {
    isCheckedSession2.value = !isCheckedSession2.value;

    if (orderStatus == 'new order') {
      if (isCheckedSession2.value) {
        getOrdersByStatusNew(2);
        print('is checked 1');
      } else {
        getOrdersByStatusNew(null);
        print('is checked 0');
      }
    } else if (orderStatus == 'proccess') {
      if (isCheckedSession2.value) {
        getOrdersByStatusProcessed(2);
      } else {
        getOrdersByStatusProcessed(null);
      }
    } else if (orderStatus == 'taken') {
      if (isCheckedSession2.value) {
        getOrdersByStatusTaken(2);
      } else {
        getOrdersByStatusTaken(null);
      }
    }
  }

  // void resetFilters(RxBool isCheckedSession1, RxBool isCheckedSession2) {   
  //   isCheckedSession1.value = false;
  //   isCheckedSession2.value = false;
  //   getOrdersByStatusNew(null);
  //   getOrdersByStatusProcessed(null);
  //   getOrdersByStatusTaken(null);
  // }

  // void saveSessionFilter() {

  // }
}
