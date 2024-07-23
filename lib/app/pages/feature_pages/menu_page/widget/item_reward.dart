import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/reward_controller.dart';

import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../../routes/AppPages.dart';

// ignore: must_be_immutable
class ItemWidgetReward extends GetView<RewardController> {
  final RewardController controller = Get.put(RewardController());

  final String description;
  final String name;
  final int regular_point;
  final int large_point;
  final String image;
  final int id;

  ItemWidgetReward({
    required this.name,
    required this.regular_point,
    required this.large_point,
    required this.image,
    required this.id,
    required this.description,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      // decoration: BoxDecoration(color: cream),
      width: 180,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.DETAIL_REWARD, arguments: {
                'id': id,
                'name': name,
                // 'price': int.parse(price.toString()),
                'regular_point': regular_point,
                'large_point': large_point,
                'image': image,
                'description': description,
              });
            },
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                      "https://tedikap-api.rplrus.com/storage/reward-product/$image")
                                  as ImageProvider,
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    }
                  }),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.19,
                        child: Text(
                          name,
                          style: subTitle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: primaryColor,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "rating",
                            style: cardTitle,
                          )
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Icon(
                      //       Icons.favorite_rounded,
                      //       color: primaryColor,
                      //       size: 18,
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Text(
                      //       "favourite",
                      //       style: cardTitle,
                      //     )
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            priceIcon,
                            color: primaryColor,
                            height: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                             regular_point.toString(),
                            
                            style: cardTitle,
                          ),
                          // Text("/"),
                          // Text(
                          //   large_price.toString(),
                          //   style: cardTitle,
                          // ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            priceIcon,
                            color: primaryColor,
                            height: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            large_point.toString(),
                            
                            style: cardTitle,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.EDIT_REWARD, arguments: {
                'id': id,
                'name': name,
                'regular_point': regular_point,
                'large_point': large_point,
                'image': image,
                'description': description,
              });
              controller.getReward();
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 25,
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(editIcon),
                  Text(
                    "Edit",
                    style: smallTextWhite,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
