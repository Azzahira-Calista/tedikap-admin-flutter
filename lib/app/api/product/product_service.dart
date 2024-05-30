import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';

class ProductService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getProducts() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.product,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getProductsTea() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.product,
        queryParameters: {
          'type'  : 'tea'
        },
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getProductsNonTea() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.product,
        queryParameters: {
          'type'  : 'non-tea'
        },
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getProductsSnack() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.product,
        queryParameters: {
          'type'  : 'snack'
        },
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}
