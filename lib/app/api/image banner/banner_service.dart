import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import '../api_endpoint.dart';

class ImageSliderService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getImageBanner() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.banner,
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> storeImageBanner({
    File? image,
  }) async {
    try {
      final formData = FormData.fromMap({
        if (image != null)
          'image': await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.banner}/store',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateaImageBanner({
    int? id,
    File? image,
  }) async {
    try {
      final formData = FormData.fromMap({
        if (id != null) 'id': id,
        if (image != null)
          'image': await MultipartFile.fromFile(image.path, filename: basename(image.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.banner}/update/$id',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteImageBanner({
    required int id,
  }) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: '${ApiEndpoint.banner}/delete/$id',
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}