import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';

import '../dio_instance.dart';

class AuthService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(
      {required String email, required String password}) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndpoint.baseUrlAuth + '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }


}
