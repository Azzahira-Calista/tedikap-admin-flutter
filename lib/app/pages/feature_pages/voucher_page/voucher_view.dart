import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/voucher_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/widget/voucher_banner.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAndToNamed(Routes.NAVBAR);
          },
          icon: Icon(Icons.arrow_back_ios),
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
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (controller.promoResponseModel.isEmpty) {
                      return Center(child: Text("No Promos Available"));
                    } else {
                      return ListView.builder(
                        itemCount: controller.promoResponseModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          final promo = controller.promoResponseModel[index];

                          return PromoBanner(
                              id: promo.id,
                              title: promo.title,
                              description: promo.description,
                              image: promo.image,
                              discount: promo.discount,
                              max_discount: promo.maxDiscount,
                              min_transaction: promo.min_transaction,
                              start_date: promo.start_date,
                              end_date: promo.end_date);
                        },
                      );
                    }
                  }),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: MediaQuery.of(context).size.height,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: myButton(
                      text: 'Tambah voucher',
                      onPressed: () {
                        Get.toNamed(Routes.TAMBAH_VOUCHER);
                      },
                      color: primaryColor,
                      textColor: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
