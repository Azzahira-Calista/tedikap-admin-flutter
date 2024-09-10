import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';

import '../api_endpoint.dart';

class VoucherService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getVoucher() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndpoint.voucher,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> storeVoucher({
    required String title,
    required String description,
    required int discount,
    required int maxDiscount,
    required int minTransaction,
    required String startDate,
    required String endDate,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        'title': title,
        'description': description,
        'discount': discount,
        'max_discount': maxDiscount,
        'min_transaction': minTransaction,
        'start_date': startDate,
        'end_date': endDate,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path,
              filename: basename(imageFile.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.voucher}/store',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateVoucher({
    int? id,
    String? title,
    String? description,
    int? discount,
    int? maxDiscount,
    int? minTransaction,
    String? startDate,
    String? endDate,
    File? imageFile,
  }) async {
    try {
      final formData = FormData.fromMap({
        if (title != null) 'title': title,
        if (description != null) 'description': description,
        if (discount != null) 'discount': discount,
        if (maxDiscount != null) 'max_discount': maxDiscount,
        if (minTransaction != null) 'min_transaction': minTransaction,
        if (startDate != null) 'start_date': startDate,
        if (endDate != null) 'end_date': endDate,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path,
              filename: basename(imageFile.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.voucher}/update/$id',
        data: formData,
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteVoucher(int id) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: '${ApiEndpoint.voucher}/delete/$id',
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
