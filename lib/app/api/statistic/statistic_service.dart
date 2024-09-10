import 'package:dio/dio.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import '../api_endpoint.dart';

class StatisticService {
  final DioInstance _dioInstance = DioInstance();

  // Future<Response> getChartDataWeek({required String query}) async {
  //   try {
  //     final response = await _dioInstance.getRequest(
  //       endpoint: '${ApiEndpoint.statistic}/analytics',
  //       queryParameters: {'period': query},
  //       isAuthorize: true,
  //     );

  //     return response;
  //   } catch (e) {
  //     throw Exception('Error fetching chart data: $e');
  //   }
  // }

  Future<Response> getChartDataWeek() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndpoint.statistic}/analytics',
          isAuthorize: true,
          queryParameters: {'period': 'this_week'});
          return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<Response> getChartDataMonth() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndpoint.statistic}/analytics',
          isAuthorize: true,
          queryParameters: {'period': 'this_month'});
          return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<Response> getChartDataYear() async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndpoint.statistic}/analytics',
          isAuthorize: true,
          queryParameters: {'period': 'this_year'});
          return response;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
  Future<Response> getEarningsData() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndpoint.statistic}/earnings',
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception('Error fetching earnings data: $e');
    }
  }
  Future<Response> getPointEarninsData() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndpoint.statistic}/point',
        isAuthorize: true,
      );

      return response;
    } catch (e) {
      throw Exception('Error fetching point earnings data: $e');
    }
  }
}
