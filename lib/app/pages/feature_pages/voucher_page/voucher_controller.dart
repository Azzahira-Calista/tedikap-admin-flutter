import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/promo/promo_service.dart';

import '../../../data/model/data_helper.dart';
import '../../../data/model/promo/promo_model.dart';
import '../../../data/model/promo/promo_response.dart';

class VoucherController extends GetxController {
  RxBool isLoading = false.obs;
  late PromoService promoService;
  late PromoResponse promoResponse;

  var promoResponseModel = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    promoService = PromoService();
    getPromoo();
  }

  Future<void> getPromoo() async {
    try {
      isLoading(true);
      final response = await promoService.getPromo();

      print("CHECK CURRENT RESPONSE");
      print(response.data);

      promoResponse = DataHelper.parseJson(response.data, (json) => PromoResponse.fromJson(json));
      promoResponseModel.value = promoResponse.data;

      print("check : ${promoResponseModel}");
      print("check oiii : ${promoResponse}");
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}