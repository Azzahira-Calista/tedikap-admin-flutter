import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/promo/promo_service.dart';

import '../../../api/dio_instance.dart';
import '../../../data/model/promo/promo_model.dart';
import '../../../data/model/promo/promo_response.dart';

class PromoController extends GetxController {
  RxBool isLoading = false.obs;
  late PromoService promoService;
  late PromoResponse promoResponse;

  List promoResponseModel = <ListPromo>[].obs;

  // DioInstance instance = DioInstance();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    promoService = PromoService();

    getPromo();
  }

  Future<void> getPromo() async {
    try {
      isLoading.value = true;

      final response = await promoService.getPromo();

      promoResponse = PromoResponse.fromJson(response.data);
      promoResponseModel = promoResponse.data.obs;


      print("promoooo: $promoResponse");
    } catch (e) {
      isLoading.value = true;
      print("erour + $e");
    } finally {
      isLoading.value = false;
    }
  }
}