import 'dart:convert';

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

    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    } else {
      throw Exception("Failed to update status store");
    }
  } catch (e) {
    print("Error updating status store: $e");
    return false;
  }
}

}