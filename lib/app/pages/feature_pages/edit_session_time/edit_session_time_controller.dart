import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_admin/app/data/model/status%20store/session_time.dart';
import 'package:tedikap_admin/app/data/model/status%20store/session_time_data.dart';

import '../../../api/status store/status_store_service.dart';

class EditSessionTimeController extends GetxController{
  RxString selectedId = '1'.obs;
  var TimeApiFormat = ''.obs;

  late StatusStoreService statusStoreService;
  late SessionTimeResponse sessionTimeResponse;
  late Rx<SessionTimeDataResponse> sessionTimeDataResponse;

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    statusStoreService = StatusStoreService();
    sessionTimeResponse = SessionTimeResponse();
    sessionTimeDataResponse = SessionTimeDataResponse().obs;

    getSessionTime();
  }

  Future<void> selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Format time  'H:i'
      final formattedTime = DateFormat('HH:mm').format(
        DateTime(2021, 1, 1, pickedTime.hour, pickedTime.minute),
      );

      controller.text = formattedTime;
      TimeApiFormat.value = formattedTime;

      print('Formatted time: $formattedTime');
    }
  }

  Future<void> getSessionTime() async {
    try {
      final response = await statusStoreService.getSessionTimes();
      if (response.statusCode == 200 || response.statusCode == 201) {
        sessionTimeDataResponse.value = SessionTimeDataResponse.fromJson(response.data);
        // print("Session time response: ${sessionTimeResponse.data}");
      } else {
        Get.snackbar("Error", "Failed to get session time");
        throw Exception("Failed to get session time");
      }
    } catch (e) {
      print("Error getting session time: $e");
      Get.snackbar("Error", "Failed to get session time");
    }
  }

  Future<void> editSessionTime() async {
    if (startTimeController.text.isEmpty || endTimeController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    try {

      final response = await statusStoreService.updateSessionTime([
        {
          "id": int.parse(selectedId.value),
          "start_time": startTimeController.text,
          "end_time": endTimeController.text
        }
      ]);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        startTimeController.clear();
        endTimeController.clear();

        getSessionTime();

        Get.snackbar("Success", "Session time updated successfully");
      } else {
        Get.snackbar("Error", "Failed to update session time");
        throw Exception("Failed to update session time");
      }
    } catch (e) {
      print("Error updating session time: $e");
      Get.snackbar("Error", "Failed to update session time");
    }
  }


}