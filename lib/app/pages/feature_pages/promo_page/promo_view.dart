import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/promo_page/promo_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/promo_page/widget/promo_banner.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class PromoView extends GetView<PromoController> {
  const PromoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offAndToNamed(Routes.NAVBAR);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            'Promo ',
            style: appBarText,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    // itemCount: 2,
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
                      }

                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: MediaQuery.of(context).size.height,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: myButton(
                      text: 'Tambah voucher',
                      onPressed: () {
                        Get.toNamed(Routes.TAMBAH_PROMO);
                      },
                      color: primaryColor,
                      textColor: white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
