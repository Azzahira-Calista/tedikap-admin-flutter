import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
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

  Future<Response> storePromo({
    required String name,
    required String description,
    required String discount,
    required String minTransaction,
    required String startDate,
    required String endDate,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        'title': name,
        'description': description,
        'discount': discount,
        'min_transaction': minTransaction,
        'start_date': startDate,
        'end_date': endDate,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path, filename: basename(imageFile.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.promo}/store',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updatePromo({
    required int id,
     String? name,
     String? description,
     String? discount,
     String? minTransaction,
     String? startDate,
     String? endDate,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        'title': name,
        'description': description,
        'discount': discount,
        'min_transaction': minTransaction,
        'start_date': startDate,
        'end_date': endDate,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path, filename: basename(imageFile.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.promo}/update/$id',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deletePromo(int id) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: '${ApiEndpoint.promo}/delete/$id',
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}