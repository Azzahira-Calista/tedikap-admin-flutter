import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/api/notification%20global/notification_global_service.dart';
import 'package:tedikap_admin/app/data/model/notification/notification_response.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class TambahNotifController extends GetxController {
  RxString imagePath = ''.obs;
  NotificationGlobalService notificationService = NotificationGlobalService();
  Notificationresponse notificationresponse = Notificationresponse();
  var notificationresponseModel = <Data>[].obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  RxBool isLoading = false.obs;

  void setImagePath(String path) {
    imagePath.value = path;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setImagePath(pickedFile.path);
    } else {
      Get.snackbar('No Image Selected', 'Please select an image to proceed.');
    }
  }

  Future<void> sendNotification() async {
    if (titleController.text.isEmpty || bodyController.text.isEmpty) {
      Get.snackbar('Missing Information', 'Title and Body cannot be empty.');
      return;
    }

    try {
      isLoading.value = true;

      final response = await notificationService.sendNotificationGlobal(
        title: titleController.text,
        body: bodyController.text,
        imageFile: imagePath.value.isNotEmpty ? File(imagePath.value) : null,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.offAndToNamed(Routes.NAVBAR + Routes.CRUD_PAGE);
        Get.snackbar('Success', 'Notification sent successfully.');
      } else {
        throw Exception('Failed to send notification');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error sending notification: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
