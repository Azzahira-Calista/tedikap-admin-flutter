// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import 'package:tedikap_admin/app/api/product/product_service.dart';
import 'package:tedikap_admin/app/data/model/product/data_model.dart';
import 'package:tedikap_admin/app/data/model/product/product_response.dart';

class MenuController extends GetxController {
  RxBool isLoading = false.obs;
  late ProductService productService;
  late ProductResponse productResponse;

  var productResponseModel = <Data>[].obs;

  DioInstance instance = DioInstance();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    productService = ProductService();

    getProducts();
    getProductsTea();
  }

  Future<void> getProducts() async {
    try {
      isLoading.value = true;

      final response = await productService.getProducts();

      productResponse = ProductResponse.fromJson(response.data);
      productResponseModel = productResponse.data.obs;

      print("produkkkkkkk: $productResponseModel");
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getProductsTea() async {
    try {
      isLoading.value = true;

      final response = await productService.getProductsTea();

      productResponse = ProductResponse.fromJson(response.data);
      productResponseModel = productResponse.data.obs;
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getProductsNonTea() async {
    try {
      isLoading.value = true;

      final response = await productService.getProductsNonTea();

      productResponse = ProductResponse.fromJson(response.data);
      productResponseModel = productResponse.data.obs;
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getProductsSnack() async {
    try {
      isLoading.value = true;

      final response = await productService.getProductsSnack();

      productResponse = ProductResponse.fromJson(response.data);
      productResponseModel = productResponse.data.obs;
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
