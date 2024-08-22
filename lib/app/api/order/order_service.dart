import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import '../api_endpoint.dart';

class OrderService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getOrdersByStatus(String status) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndpoint.order}/get-order?status=$status',
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  //  Future<Response> getOrdersByStatus(String status, {int? session}) async {
  //   try {
  //     // final String sessionQuery = session != null ? '&session=$session' : '';
  //     final response = await _dioInstance.getRequest(
  //       endpoint: '${ApiEndpoint.order}/get-order?status=$status order&session=$session',
  //       isAuthorize: true,
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<Response> getHistoryOrderByType(String type) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndpoint.order}$type/history?type=history',
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> acceptanceOrder(String orderId, String action) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint: '${ApiEndpoint.order}/update-status/$orderId?action=$action',
        data: {},
        isAuthorize: true,
      );
      return response;
    } on DioError catch (e) {
      // Log detailed error response
      print("Error Response Data: ${e.response?.data}");
      print("Error Response Status: ${e.response?.statusCode}");
      print("Error Response Headers: ${e.response?.headers}");
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> readyOrder(String orderId, String action) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint:
            '${ApiEndpoint.order}/update-status-siap/$orderId?action=$action',
        data: {},
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> finishOrder(String orderId, String action) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint:
            '${ApiEndpoint.order}/update-status-selesai/$orderId?action=$action',
        data: {},
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
