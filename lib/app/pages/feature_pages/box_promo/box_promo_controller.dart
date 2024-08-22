import 'package:get/get.dart';
import 'package:tedikap_admin/app/api/box%20promo/box_promo_service.dart';

import '../../../data/model/box promo/box_promo_model.dart';
import '../../../data/model/box promo/box_promo_response.dart';
import '../../../data/model/data_helper.dart';

class BoxPromoController extends GetxController {
  RxBool isLoading = false.obs;
  late BoxPromoService boxPromoService;
  late BoxPromoResponse boxPromoResponse;
  var boxPromoResponseModel = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    boxPromoService = BoxPromoService();
    getBoxPromo();
  }

  Future<void> getBoxPromo() async {
    try {
      isLoading(true);
      final response = await boxPromoService.getBoxPromo();

      print("CHECK CURRENT RESPONSE");
      print(response.data);

       final boxPromoResponse = BoxPromoResponse.fromJson(response.data);
    boxPromoResponseModel.assignAll(boxPromoResponse.data!.values.toList());

      print("check : ${boxPromoResponseModel}");
      print("check oiii : ${boxPromoResponse}");
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
