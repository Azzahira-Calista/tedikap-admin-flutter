import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/box_promo/box_promo_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/box_promo/widget/box_promo.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class BoxPromoView extends GetView<BoxPromoController> {
  const BoxPromoView({super.key});

  Future<void> refreshData() async {
    controller.getBoxPromo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Box Promos',
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
                    } else if (controller.boxPromoResponseModel.isEmpty) {
                      return Center(child: Text("No Promos Available"));
                    } else {
                      return ListView.builder(
                          itemCount: controller.boxPromoResponseModel.length,
                          itemBuilder: (BuildContext context, int index) {
                            final boxPromo =
                                controller.boxPromoResponseModel[index];

                            return BoxPromo(
                                id: boxPromo.id!,
                                title: boxPromo.title!,
                                subtitle: boxPromo.subtitle!,
                                image: boxPromo.image!);
                          });
                    }
                  }),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: MediaQuery.of(context).size.height,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: myButton(
                      text: 'Tambah box promo',
                      onPressed: () {
                        Get.toNamed(Routes.TAMBAH_BOX_PROMO);
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
