// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import 'package:tedikap_admin/app/data/model/product_item_model.dart';
import 'package:tedikap_admin/app/pages/initial_pages/login_page/login_controller.dart';

class MenuController extends GetxController {
  var productResponseModel = <Product>[].obs;

  DioInstance instance = DioInstance();
 

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataLearning();
  }

  Future<void> getDataLearning() async {
    try {

      final dio.Response response =
          await instance.getRequest(endpoint: '/product');

      print(response.data);

      if (response.statusCode == 200) {
        final List<dynamic> ProductList = response.data["data"];

        productResponseModel.value =
            ProductList.map((json) => Product.fromJson(json)).toList();
      } else {
        print("Failed to fetch learning. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error while fetching learning: $error");
    }
  }
}
