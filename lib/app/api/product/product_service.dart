import 'dart:io';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import 'package:path/path.dart';

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
        queryParameters: {'type': 'tea'},
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
        queryParameters: {'type': 'non-tea'},
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
        queryParameters: {'type': 'snack'},
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

// Future<Response> storeProduct() async {
//     try {
//       final response = await _dioInstance.postImageRequest(
//         endpoint: '${ApiEndpoint.product}/store',
//         data: formsData,
//         isAuthorize: true,
//       );
//
//       return response;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

 Future<Response> storeProduct({
    required String name,
    required String description,
    required String category,
    required String regularPrice,
    required String largePrice,
    File? imageFile,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'description': description,
        'category': category,
        'regular_price': regularPrice,
        'large_price': largePrice,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path, filename: basename(imageFile.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.product}/store',
        data: formData,
        isAuthorize: true,
        options: Options(contentType: 'multipart/form-data'),
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateProduct({
    int? id,
    String? name,
    String? description,
    String? category,
    String? regularPrice,
    String? largePrice,
    File? imageFile,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        if (name != null) 'name': name,
        if (description != null) 'description': description,
        if (category != null) 'category': category,
        if (regularPrice != null) 'regular_price': regularPrice,
        if (largePrice != null) 'large_price': largePrice,
        if (imageFile != null)
          'image': await MultipartFile.fromFile(imageFile.path, filename: basename(imageFile.path)),
      });

      final response = await _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.product}/update/$id',
        data: formData,
        isAuthorize: true,
        // options: Options(contentType: 'multipart/form-data'),
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteProduct(int id) async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: '${ApiEndpoint.product}/delete/$id',
        isAuthorize: true,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
