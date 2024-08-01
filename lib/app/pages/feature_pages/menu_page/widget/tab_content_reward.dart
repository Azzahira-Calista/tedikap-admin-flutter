// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/reward_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_menu.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/reward_filter.dart';

import '../../../../../common/themes.dart';
import '../../../../../routes/AppPages.dart';
import '../../../global_components/button.dart';

class MenuRewardTabContent extends GetView<RewardController> {
  RewardController controller = Get.put(RewardController());

  Future<void> refreshData() async {
    controller.getReward();
  }

  @override
  Widget build(BuildContext context) {
    // controller.getReward();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: RefreshIndicator(
          onRefresh: refreshData,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RewardFilter(),
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
                        return Container(
                          // height: MediaQuery.of(context).size.height * 0.7,
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.rewardResponseModel.length,
                              itemBuilder: (context, index) {
                                final product =
                                    controller.rewardResponseModel[index];
                                return ItemWidgetReward(
                                  description: product.description!,
                                  id: product.id!,
                                  name: product.name!,
                                  regularPoint: product.regularPoint!,
                                  largePoint: product.largePoint!,
                                  image: product.image!,
                                  category: product.category!,
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: myButton(
                    text: 'Tambah menu',
                    onPressed: () async {
                      await Get.toNamed(Routes.TAMBAH_REWARD);
                      controller.getReward();
                    },
                    color: primaryColor,
                    textColor: white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
