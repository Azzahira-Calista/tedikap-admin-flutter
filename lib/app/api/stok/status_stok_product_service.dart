import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';

class StatusStockProductService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> updateStockReward(int id, bool stok) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint: '${ApiEndpoint.reward}/update-stock/$id',
        data: {
          'stock': stok,
        },
        isAuthorize: true,
      );

      // print("Response status: ${response.statusCode}");
      // print("Response data: ${response.data}");

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

  Future<Response> updateStockProduct(int id, bool stok) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint: '${ApiEndpoint.product}/update-stock/$id',
        data: {
          'stock': stok,
        },
        isAuthorize: true,
      );

      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");

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
}
