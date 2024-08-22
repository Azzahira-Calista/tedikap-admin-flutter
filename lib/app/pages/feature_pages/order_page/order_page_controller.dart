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

  TextEditingController endDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();

   var isCheckedSession1 = false.obs;
  var isCheckedSession2 = false.obs;

  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    orderService = OrderService();

    getOrdersByStatusNew();
    getOrdersByStatusProcessed();
    getOrdersByStatusTaken();
    super.onInit();
  }

  

  Future<void> getOrdersByStatusNew() async {
    try {
      isLoading.value = true;
      final response = await orderService.getOrdersByStatus('new order');
      orderResponse = OrderResponse.fromJson(response.data);
      newOrderResponseModel.value = orderResponse.orders ?? [];
      print("New Orders: ${newOrderResponseModel.length}");
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOrdersByStatusProcessed() async {
    try {
      isLoading.value = true;
      final response = await orderService.getOrdersByStatus('proccess');
      orderResponse = OrderResponse.fromJson(response.data);
      processedOrderResponseModel.value = orderResponse.orders ?? [];
      print("Processed Orders: ${processedOrderResponseModel.length}");

      print(response.data);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getOrdersByStatusTaken() async {
    try {
      isLoading.value = true;
      final response = await orderService.getOrdersByStatus('taken');
      orderResponse = OrderResponse.fromJson(response.data);
      takenOrderResponseModel.value = orderResponse.orders ?? [];
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

void toggleSession1() {
    isCheckedSession1.value = !isCheckedSession1.value;
  }

  void toggleSession2() {
    isCheckedSession2.value = !isCheckedSession2.value;
  }
  void resetFilters() {
    isCheckedSession1.value = false;
    isCheckedSession2.value = false;
    startDateController.clear();
    endDateController.clear();
    // filterOrdersBySession(0); 

  }

void saveSessionFilter() {
    int session = 0;  

    if (isCheckedSession1.value && isCheckedSession2.value) {
      session = 0;  
    } else if (isCheckedSession1.value) {
      session = 1; 
    } else if (isCheckedSession2.value) {
      session = 2;
    }

    // filterOrdersBySession(session);
  }

}

// class OrderController extends GetxController {
//   RxBool isLoading = false.obs;
//   late OrderService orderService;
//   late OrderResponse orderResponse;
//   RxList<Orders> newOrderResponseModel = <Orders>[].obs;
//   RxList<Orders> processedOrderResponseModel = <Orders>[].obs;
//   RxList<Orders> takenOrderResponseModel = <Orders>[].obs;

//   TextEditingController endDateController = TextEditingController();
//   TextEditingController startDateController = TextEditingController();

//   var isCheckedSession1 = false.obs;
//   var isCheckedSession2 = false.obs;

//   var currentIndex = 0.obs;

//   void setCurrentIndex(int index) {
//     currentIndex.value = index;
//   }

//   @override
//   void onInit() {
//     orderService = OrderService();

//     getOrdersByStatusNew();
//     getOrdersByStatusProcessed();
//     getOrdersByStatusTaken();
//     super.onInit();
//   }

// void toggleSession1() {
//     isCheckedSession1.value = !isCheckedSession1.value;
//   }

//   void toggleSession2() {
//     isCheckedSession2.value = !isCheckedSession2.value;
//   }
//   Future<void> getOrdersByStatusNew({int session = 0}) async {
//     try {
//       isLoading.value = true;
//       final response = await orderService.getOrdersByStatus('new order', session: session);
//       orderResponse = OrderResponse.fromJson(response.data);
//       newOrderResponseModel.value = orderResponse.orders ?? [];
//       print("New Orders: ${newOrderResponseModel.length}");
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> getOrdersByStatusProcessed({int session = 0}) async {
//     try {
//       isLoading.value = true;
//       final response = await orderService.getOrdersByStatus('processed', session: session);
//       orderResponse = OrderResponse.fromJson(response.data);
//       processedOrderResponseModel.value = orderResponse.orders ?? [];
//       print("Processed Orders: ${processedOrderResponseModel.length}");
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> getOrdersByStatusTaken({int session = 0}) async {
//     try {
//       isLoading.value = true;
//       final response = await orderService.getOrdersByStatus('taken', session: session);
//       orderResponse = OrderResponse.fromJson(response.data);
//       takenOrderResponseModel.value = orderResponse.orders ?? [];
//       print("Taken Orders: ${takenOrderResponseModel.length}");
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void saveSessionFilter() {
//     int session = 0;  // Default: Both sessions

//     if (isCheckedSession1.value && isCheckedSession2.value) {
//       session = 0;  // Both sessions
//     } else if (isCheckedSession1.value) {
//       session = 1; // Session 1
//     } else if (isCheckedSession2.value) {
//       session = 2; // Session 2
//     }

//     // Fetch orders with the selected session filter
//     getOrdersByStatusNew(session: session);
//     getOrdersByStatusProcessed(session: session);
//     getOrdersByStatusTaken(session: session);
//   }

//   void resetFilters() {
//     isCheckedSession1.value = false;
//     isCheckedSession2.value = false;
//     startDateController.clear();
//     endDateController.clear();
//   }

  
//   Future<void> acceptOrder(String orderId) async {
//     try {
//       isLoading.value = true;
//       final response = await orderService.acceptanceOrder(orderId, 'accepted');
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Get.toNamed(Routes.NAVBAR + Routes.ORDER);
//         Get.snackbar("Order Accepted", "Order has been accepted successfully!");
//       } else {
//         Get.snackbar("Error", "Failed to accept order");
//       }
//     } catch (e) {
//       print("Error: $e");
//       Get.snackbar("Error", "An error occurred while accepting the order");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> rejectOrder(String orderId) async {
//     try {
//       isLoading.value = true;
//       final response = await orderService.acceptanceOrder(orderId, 'rejected');
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Get.toNamed(Routes.NAVBAR + Routes.ORDER);
//         Get.snackbar("Order Rejected", "Order has been rejected successfully!");
//       } else {
//         Get.snackbar("Error", "Failed to reject order");
//       }
//     } catch (e) {
//       print("Error: $e");
//       Get.snackbar("Error", "An error occurred while rejecting the order");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> readyOrder(String orderId) async {
//     try {
//       isLoading.value = true;
//       final response = await orderService.readyOrder(orderId, 'accepted');
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Get.toNamed(Routes.NAVBAR + Routes.ORDER);
//         Get.snackbar("Order Ready", "Order is ready for pickup!");
//       } else {
//         Get.snackbar("Error", "Failed to set order as ready");
//       }
//     } catch (e) {
//       print("Error: $e");
//       Get.snackbar(
//           "Error", "An error occurred while setting the order as ready");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> rejectReadyOrder(String orderId) async {
//     try {
//       isLoading.value = true;
//       final response = await orderService.readyOrder(orderId, 'rejected');
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Get.toNamed(Routes.NAVBAR + Routes.ORDER);
//         Get.snackbar("Order Rejected", "Order has been rejected successfully!");
//       } else {
//         Get.snackbar("Error", "Failed to reject order");
//       }
//     } catch (e) {
//       print("Error: $e");
//       Get.snackbar("Error", "An error occurred while rejecting the order");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> finishOrder(String orderId) async {
//     try {
//       isLoading.value = true;
//       final response = await orderService.finishOrder(orderId, 'accepted');
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Get.toNamed(Routes.NAVBAR + Routes.ORDER);
//         Get.snackbar(
//             "Order Finished", "Order has been completed successfully!");
//       } else {
//         Get.snackbar("Error", "Failed to complete order");
//       }
//     } catch (e) {
//       print("Error: $e");
//       Get.snackbar("Error", "An error occurred while completing the order");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> rejectFinishOrder(String orderId) async {
//     try {
//       isLoading.value = true;
//       final response = await orderService.finishOrder(orderId, 'rejected');
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Get.toNamed(Routes.NAVBAR + Routes.ORDER);
//         Get.snackbar("Order Rejected", "Order has been rejected successfully!");
//       } else {
//         Get.snackbar("Error", "Failed to reject order");
//       }
//     } catch (e) {
//       print("Error: $e");
//       Get.snackbar("Error", "An error occurred while rejecting the order");
//     } finally {
//       isLoading.value = false;
//     }
//   }

// Future<void> selectDate(
//       BuildContext context, TextEditingController controller) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2050),
//     );
//     if (pickedDate != null) {
//       controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
//     }
//   }

// }

