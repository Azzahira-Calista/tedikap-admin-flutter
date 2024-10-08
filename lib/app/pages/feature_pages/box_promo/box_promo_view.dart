import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/box_promo/box_promo_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/box_promo/widget/box_promo.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class BoxPromoView extends GetView<BoxPromoController> {
  const BoxPromoView({super.key});

  Future<void> refreshData() async {
    await controller.getBoxPromo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_BOX_PROMO);
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
          'Box Promos',
          style: appBarText,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refreshData,
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.boxPromoResponseModel.isEmpty) {
              return ListView(
                children: [
                  SizedBox(
                    height: Get.height * 0.7,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            orderEmptyIcon,
                            width: 150,
                            height: 150,
                          ),
                          const SizedBox(height: 20),
                          Text('No Promo available', style: normalText),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: controller.boxPromoResponseModel.length,
                itemBuilder: (BuildContext context, int index) {
                  final boxPromo = controller.boxPromoResponseModel[index];

                  return BoxPromo(
                    id: boxPromo.id!,
                    title: boxPromo.title!,
                    subtitle: boxPromo.subtitle!,
                    image: boxPromo.image!,
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
