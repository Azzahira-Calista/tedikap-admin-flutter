import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/promo_page/promo_page_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/promo_page/widgets/promo_banner.dart';

import '../../../../common/themes.dart';
import '../../../../routes/AppPages.dart';

class PromoPage extends GetView<PromoPageController> {
  const PromoPage({super.key});

  Future<void> refreshData() async {
    controller.getPromo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed(Routes.PICK_PRODUCT);
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
          'Promo',
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
                    } else if (controller.promoResponseModel.isEmpty) {
                      return const Center(child: Text("No Promo Available"));
                    } else {
                      return ListView.builder(
                        itemCount: controller.promoResponseModel.length,
                        itemBuilder: (BuildContext context, int index) {
                          final promo = controller.promoResponseModel[index];

                          return PromoBanner(id: promo.id!, title: promo.title!, description: promo.description!,  discount: promo.discount!, end_date: promo.endDate!, start_date: promo.startDate!, promoItems: promo.products!);
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