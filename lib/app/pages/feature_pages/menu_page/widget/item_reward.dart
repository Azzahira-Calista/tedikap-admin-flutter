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
  final String category;
  final int regularPoint;
  final int largePoint;
  final String image;
  final int id;

  ItemWidgetReward({
    required this.name,
    required this.category,
    required this.regularPoint,
    required this.largePoint,
    required this.image,
    required this.id,
    required this.description,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 180,
      height: 100,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: cream,
        borderRadius: BorderRadius.circular(15),
      ),
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
                'regularPoint': regularPoint,
                'largePoint': largePoint,
                'image': image,
                'description': description,
                'category': category,
              });
            },
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Obx(() {
                          if (controller.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: offColor,
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
                            Text(
                              name,
                              style: subTitle,
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
                                  regularPoint.toString(),
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
                                  largePoint.toString(),
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
                            //       "rating",
                            //       style: cardTitle,
                            //     )
                            //   ],
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Icon(
                                //   Icons.favorite_rounded,
                                //   color: primaryColor,
                                //   size: 18,
                                // ),
                                // SizedBox(
                                //   width: 5,
                                // ),
                                Text(
                                  "",
                                  style: cardTitle,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.EDIT_REWARD, arguments: {
                        'id': id,
                        'name': name,
                        'regularPoint': regularPoint,
                        'largePoint': largePoint,
                        'image': image,
                        'description': description,
                        'category': category,
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            ),
          ),
        ],
      ),
    );
  }
}
