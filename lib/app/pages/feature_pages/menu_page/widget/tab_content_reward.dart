// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/reward_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/reward_filter.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class MenuRewardTabContent extends GetView<RewardController> {
  @override
  RewardController controller = Get.put(RewardController());

  MenuRewardTabContent({super.key});

  Future<void> refreshData() async {
    controller.fetchFilteredProducts('tea');
  }

  @override
  Widget build(BuildContext context) {
    // controller.getReward();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_REWARD);
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: RefreshIndicator(
            onRefresh: refreshData,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RewardFilter(),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (controller.rewardResponseModel.isEmpty) {
                        return const Center(
                            child: Text('No product available'));
                      }
                      return SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.rewardResponseModel.length,
                          itemBuilder: (context, index) {
                            final product =
                                controller.rewardResponseModel[index];
                            return ItemWidgetReward(
                              description: product.description!,
                              stock: product.stock!,
                              id: product.id!,
                              name: product.name!,
                              regularPoint: product.regularPoint!,
                              largePoint: product.largePoint!,
                              image: product.image!,
                              category: product.category!,
                            );
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
