import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';

import '../api_endpoint.dart';

class PromoService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getPromo() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.promo,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}