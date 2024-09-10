import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/promo/promo_service.dart';
import 'package:tedikap_admin/app/data/model/promo/promo_model.dart';
import 'package:tedikap_admin/app/data/model/promo/promo_response.dart';

import '../../../data/model/data_helper.dart';

class PromoPageController extends GetxController {
  RxBool isLoading = false.obs;
  late PromoService promoService;
  late PromoResponse promoResponse;

  var promoResponseModel = <Promo>[].obs;

  @override
  void onInit() {
    super.onInit();
    promoService = PromoService();
    getPromo();
  }

  Future<void> getPromo() async {
    try {
      isLoading(true);

      final response = await promoService.getPromo();

      print("CHECK CURRENT RESPONSE");
      print(response.data);

      // Parsing response JSON menjadi PromoResponse object
      promoResponse = DataHelper.parseJson(response.data, (json) => PromoResponse.fromJson(json));

      if (promoResponse.promo != null) {
        promoResponseModel.value = promoResponse.promo!;
      } else {
        promoResponseModel.clear();
      }

      print("check : ${promoResponseModel}");
      print("check oiii : ${promoResponse}");
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
