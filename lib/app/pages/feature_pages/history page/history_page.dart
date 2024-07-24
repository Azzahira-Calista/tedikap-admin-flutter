import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/history%20page/history_controller.dart';
import 'package:tedikap_admin/common/themes.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "History orders",
            style: appBarText,
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.orderResponseModel.isEmpty) {
            return Center(child: Text('No order available'));
          }
          return Container(
            child: Text("hi"),
          );
        }));
  }
}
