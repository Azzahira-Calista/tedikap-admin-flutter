import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';

class NotificationGlobalService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> sendNotificationGlobal({
    String? title,
    String? body,
    String? route,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        'title': title,
        'body': body,
        'route': "notification",
        if (imageFile != null)
          'image': await MultipartFile.fromFile(
            imageFile.path,
            filename: basename(imageFile.path),
          ),
      });

      final response = await _dioInstance.postRequest(
        endpoint: ApiEndpoint.notification,
        data: formData,
        isAuthorize: true,
      );
      print(formData.fields);

      return response;
    } catch (e) {
      print('Error sending notification: $e');
      throw Exception('Error sending notification: $e');
    }
  }
}
