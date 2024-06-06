import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/promo/promo_service.dart';

import '../../../api/dio_instance.dart';
import '../../../data/model/promo/promo_model.dart';
import '../../../data/model/promo/promo_response.dart';

class PromoController extends GetxController {
  RxBool isLoading = false.obs;
  late PromoService promoService;
  late PromoResponse promoResponse;

  var promoResponseModel = <Data>[].obs;

  // DioInstance instance = DioInstance();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    promoService = PromoService();
  }

  Future<void> getPromo() async {
    try {
      isLoading.value = true;

      final response = await promoService.getPromo();

      promoResponse = PromoResponse.fromJson(response.data);
      promoResponseModel = promoResponse.data.obs;


      print("promo: $promoResponse");
    } catch (e) {
      isLoading.value = true;
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}