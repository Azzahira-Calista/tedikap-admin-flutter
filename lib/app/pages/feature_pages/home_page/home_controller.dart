import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:tedikap_admin/app/api/status%20store/status_store_Service.dart';

class HomeController extends GetxController {
  var selectedRange = "This Week".obs;
  var isLoading = true.obs;
  var isSwitched = false.obs;
  final StatusStoreService statusStoreService = StatusStoreService();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void changeRange(String range) {
    selectedRange.value = range;
  }

  void toggeStoreStatus(bool value) async {
    isSwitched.value = value;
    if (value) {
      await openStore();
    } else {
      await closeStore();
    }
  }

  Future<void> openStore() async {
    print("Opening store...");
    bool result = await statusStoreService.updateStatusStore(true);
    if (result) {
      print("Store is open");
    } else {
      print("Failed to open store");
    }
  }

  Future<void> closeStore() async {
    print("Closing store...");
    bool result = await statusStoreService.updateStatusStore(false);
    if (result) {
      print("Store is closed");
    } else {
      print("Failed to close store");
    }
  }

  void loadData() async {
    // Simulate data loading
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }
}
