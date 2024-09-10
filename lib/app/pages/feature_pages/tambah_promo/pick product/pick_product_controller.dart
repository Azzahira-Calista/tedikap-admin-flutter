import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/product/product_service.dart';

import '../../../../data/model/product/data_model.dart';


class PickProductController extends GetxController{
  RxBool isLoading = false.obs;
  Rxn<int> selectedProductId = Rxn<int>();
  ProductService productService = ProductService();
  var productResponseModel = <Data>[].obs;

  @override
  onInit() {
    super.onInit();
    getProducts();
  }
  Future<void> getProducts() async {
    try {
      isLoading(true);
      final response = await productService.getProduct();
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        productResponseModel.value =
            data.map((json) => Data.fromJson(json)).toList();
        print('Products loaded: ${productResponseModel.length}');
      } else {
        productResponseModel.clear();
        print('No products found');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading(false);
      update();
    }
  }


}