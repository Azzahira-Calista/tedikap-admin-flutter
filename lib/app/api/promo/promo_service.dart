import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/api_endpoint.dart';

import '../dio_instance.dart';

class PromoService{
  final DioInstance _dioInstance = DioInstance();

  Future<Response>getPromo(){
    try{
      final response = _dioInstance.getRequest(
        endpoint: ApiEndpoint.promo,
        isAuthorize: true,
      );
      return response;
    }catch(e){
      throw Exception(e);
    }
  }

  Future<Response> storePromo({
    required String title,
    required String description,
    required int discount,
    required String startDate,
    required String endDate,
    required List<int> productId,
    required String priceType,
  }) {
    try {
      final response = _dioInstance.postRequest(
        endpoint: '${ApiEndpoint.promo}/store',
        isAuthorize: true,
        data: {
          'title': title,
          'description': description,
          'discount': discount,
          'start_date': startDate,
          'end_date': endDate,
          'product_id': productId,
          'price_type': priceType,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}