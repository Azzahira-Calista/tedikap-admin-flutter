import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';

class StatusStoreService {
  final DioInstance _dioInstance = DioInstance();

  Future<bool> updateStatusStore(bool statusStore) async {
  try {
    final response = await _dioInstance.putRequest(
      endpoint: '${ApiEndpoint.statusStore}/update',
      data: jsonEncode({
        'status_store': statusStore,
      }),
      isAuthorize: true,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception("Failed to update status store");
    }
  } catch (e) {
    print("Error updating status store: $e");
    return false;
  }
}

Future<Response> getStatusStore() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.statusStore,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception(e.toString());
    }
  }

  // Future<Response> updateSessionTime(int id, String startTime, String endTime) async {
  //   try {
  //     final response = await _dioInstance.putRequest(
  //       endpoint: '${ApiEndpoint.statusStore}/update-session-times',
  //       data: jsonEncode({
  //         'id': id,
  //         'start_time': startTime,
  //         'end_time': endTime,
  //       }),
  //       isAuthorize: true,
  //     );
  //
  //     return response;
  //   } on DioException catch (e) {
  //     print("DioException: ${e.message}");
  //     print("Response data (if any): ${e.response?.data}");
  //     throw Exception(e.message);
  //   } catch (e) {
  //     print("Unexpected error: $e");
  //     throw Exception(e.toString());
  //   }
  // }
  Future<Response> updateSessionTime(List<Map<String, dynamic>> sessionTimes) async {
    try {
      // Create the request data
      // final requestData = {
      //   'id': id,
      //   'start_time': startTime,
      //   'end_time': endTime,
      // };

      final requestData = {
        'session_times': sessionTimes
      };

      // Debug print to log the request details
      print('Request Endpoint: ${ApiEndpoint.statusStore}/update-session-times');
      print('Request Body: ${jsonEncode(requestData)}'); // This will show the exact JSON sent to the API

      // Make the actual request
      final response = await _dioInstance.putRequest(
        endpoint: '${ApiEndpoint.statusStore}/update-session-times',
        data: jsonEncode(requestData),
        isAuthorize: true,
      );

      return response;
    } on DioException catch (e) {
      print("DioException: ${e.message}");
      print("Response data (if any): ${e.response?.data}");
      throw Exception(e.message);
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception(e.toString());
    }
  }

  Future<Response> getSessionTimes() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndpoint.statusStore}/session-times',
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception(e.toString());
    }
  }

}