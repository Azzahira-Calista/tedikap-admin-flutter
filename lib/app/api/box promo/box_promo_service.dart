import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import '../api_endpoint.dart';

class BoxPromoService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getBoxPromo() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.boxPromo,
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> storeBoxPromo({
    required String title,
    required String subtitle,
    File? image,
  }) async {
    try {
      final formData = FormData.fromMap({
        'title': title,
        'subtitle': subtitle,
        if (image != null)
          'image': await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.boxPromo}/store',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateBoxPromo({
    int? id,
    String? title,
    String? subtitle,
    File? image,
  }) async {
    try {
      final formData = FormData.fromMap({
        if (id != null) 'id': id,
        if (title != null) 'title': title,
        if (subtitle != null) 'subtitle': subtitle,
        if (image != null)
          'image': await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.boxPromo}/update/$id',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteBoxPromo({
    required int id,
  }) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: '${ApiEndpoint.boxPromo}/delete/$id',
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}