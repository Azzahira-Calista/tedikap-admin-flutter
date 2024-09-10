import 'package:get/get.dart';

import '../../../api/voucher/voucher_service.dart';
import '../../../data/model/voucher/voucher_model.dart';
import '../../../data/model/data_helper.dart';
import '../../../data/model/voucher/voucher_response.dart';

class VoucherController extends GetxController {
  RxBool isLoading = false.obs;
  late VoucherService voucherService;
  late VoucherResponse voucherResponse;

  var voucherResponseModel = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    voucherService = VoucherService();
    getVoucher();
  }

  Future<void> getVoucher() async {
    try {
      isLoading(true);
      final response = await voucherService.getVoucher();

      print("CHECK CURRENT RESPONSE");
      print(response.data);

      voucherResponse = DataHelper.parseJson(response.data, (json) => VoucherResponse.fromJson(json));
      voucherResponseModel.value = voucherResponse.data;

      print("check : ${voucherResponseModel}");
      print("check oiii : ${voucherResponse}");
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}