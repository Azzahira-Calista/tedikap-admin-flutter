import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/voucher_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/widget/voucher_banner.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class VoucherView extends GetView<VoucherController> {
  const VoucherView({super.key});

  Future<void> refreshData() async {
    controller.getPromoo();
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
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (controller.promoResponseModel.isEmpty) {
                      return const Center(child: Text("No Promos Available"));
                    } else {
                      return ListView.builder(
                        itemCount: controller.promoResponseModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          final promo = controller.promoResponseModel[index];

                          return PromoBanner(
                            id: promo.id!,
                            title: promo.title!,
                            description: promo.description!,
                            image: promo.image!,
                            discount: promo.discount!,
                            max_discount: promo.maxDiscount!,
                            min_transaction: promo.minTransaction!,
                            start_date: promo.startDate!,
                            end_date: promo.endDate!,
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
