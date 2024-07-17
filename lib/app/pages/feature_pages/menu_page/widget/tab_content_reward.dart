// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/reward_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_menu.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_reward.dart';

import '../../../../../common/themes.dart';
import '../../../../../routes/AppPages.dart';
import '../../../global_components/button.dart';
import 'menu_filter.dart';

class MenuRewardTabContent extends GetView<RewardController> {
  RewardController controller = Get.put(RewardController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              MenuFilter(),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.rewardResponseModel.isEmpty) {
                  return Center(child: Text('No product available'));
                }
                return Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.4,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            final reward =
                                controller.rewardResponseModel[index];
                            return ItemWidgetReward(
                              id: reward.id!,
                              description: reward.description!,
                              name: reward.name!,
                              regular_point: reward.regularPoint!,
                              large_point: reward.largePoint!,
                              image: reward.image!,
                            );
                          },
                          childCount: controller.rewardResponseModel.length,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 30),
              myButton(
                text: 'Tambah menu',
                onPressed: () {
                  Get.toNamed(Routes.TAMBAH_REWARD);
                },
                color: primaryColor,
                textColor: white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
