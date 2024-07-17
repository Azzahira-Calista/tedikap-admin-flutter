// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/dio_instance.dart';
import 'package:tedikap_admin/app/api/product/product_service.dart';
import 'package:tedikap_admin/app/data/model/product/data_model.dart';
import 'package:tedikap_admin/app/data/model/product/product_response.dart';

class MenusController extends GetxController {
  RxBool isLoading = false.obs;
  late ProductService productService;
  late ProductResponse productResponse;
  RxInt currentIndex = 0.obs;
  RxString currentCategory = 'tea'.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }
  var productResponseModel = <Data>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    productService = ProductService();

    getProducts();
    getProductsTea();
  }

  void updateCategory(String category) {
    currentCategory.value = category;
    fetchFilteredProducts(category);
  }

  

  Future<void> getProducts() async {
    try {
      isLoading.value = true;

      final response = await productService.getProducts();

      productResponse = ProductResponse.fromJson(response.data);
      productResponseModel = productResponse.data.obs;

      // print("produkkkkkkk: $productResponseModel");
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

  Future<void> fetchFilteredProducts(String category) async {
    try {
      isLoading(true);
      final response = await productService.getFilterProduct(query: category);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        productResponseModel.value = data.map((json) => Data.fromJson(json)).toList();
        print('Filtered products loaded: ${productResponseModel.length}');
      } else {
        productResponseModel.clear();
        print('No products found for category: $category');
      }
    } catch (e) {
      print('Error fetching filtered products: $e');
    } finally {
      isLoading(false);
    }
  }
}
