import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';

import '../api_endpoint.dart';

class OrderService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getHistoryOrders() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndpoint.order}/history',
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}