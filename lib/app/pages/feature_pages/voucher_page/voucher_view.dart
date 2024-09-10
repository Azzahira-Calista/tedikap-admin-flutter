import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/voucher_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/widget/voucher_banner.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class VoucherView extends GetView<VoucherController> {
  const VoucherView({super.key});

  Future<void> refreshData() async {
    controller.getVoucher();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_VOUCHER);
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Vouchers',
          style: appBarText,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (controller.voucherResponseModel.isEmpty) {
                      return const Center(child: Text("No Voucher Available"));
                    } else {
                      return ListView.builder(
                        itemCount: controller.voucherResponseModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          final voucher = controller.voucherResponseModel[index];

                          return VoucherBanner(
                            id: voucher.id!,
                            title: voucher.title!,
                            description: voucher.description!,
                            image: voucher.image!,
                            discount: voucher.discount!,
                            max_discount: voucher.maxDiscount!,
                            min_transaction: voucher.minTransaction!,
                            start_date: voucher.startDate!,
                            end_date: voucher.endDate!,
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
