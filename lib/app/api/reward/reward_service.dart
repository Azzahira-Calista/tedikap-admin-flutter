import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';

class RewardService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getReward() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.reward,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> storeReward({
    required String name,
    required String description,
    required int regularPoint,
    required int largePoint,
    required String category,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'description': description,
        'regular_point': regularPoint,
        'large_point': largePoint,
        'category': category,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path,
              filename: imageFile.path),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.reward}/store',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateReward({
    int? id,
     String? name,
     String? description,
     int? regularPoint,
     int? largePoint,
     String? category,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        // if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        // 'regular_point': regularPoint,
        // 'large_point': largePoint,
        if (regularPoint != null) 'regular_point': regularPoint,
        if (largePoint != null) 'large_point': largePoint,
        // if (category != null) 'category': category,
        if (category != null) 'category': category,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path,
              filename: imageFile.path),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.reward}/update/$id',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteReward(int id) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: '${ApiEndpoint.reward}/delete/$id',
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getFilterReward({required String query}) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndpoint.filter}/reward-product/',
          queryParameters: {'category': query},
          isAuthorize: true);

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
