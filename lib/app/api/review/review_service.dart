import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import '../api_endpoint.dart';

class ReviewService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getReviews() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.review, 
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
