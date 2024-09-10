// ignore_for_file: must_be_immutable, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_controller.dart';

import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../../routes/AppPages.dart';

class ItemWidget extends GetView<MenusController> {
  final String description;
  final String name;
  final int regular_price;
  final int large_price;
  final String image;
  final int id;
  final String category;
  int? favorites_count;
  final bool stock;

  ItemWidget({
    super.key,
    required this.name,
    required this.regular_price,
    required this.large_price,
    required this.image,
    required this.id,
    required this.description,
    required this.category,
    this.favorites_count,
    required this.stock,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: cream,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      width: 180,
      height: 100,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.DETAIL_MENU, arguments: {
                  'id': id,
                  'name': name,
                  'stock': stock,
                  // 'price': int.parse(price.toString()),
                  'regular_price': regular_price,
                  'large_price': large_price,
                  'image': image,
                  'description': description,
                  'category': category,
                  'favorites_count': favorites_count,
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: offColor,
                              image: DecorationImage(
                                  image: NetworkImage(
                                          "https://tedikap-api.rplrus.com/storage/product/$image")
                                      as ImageProvider,
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          );
                        }
                      }),
                      const SizedBox(width: 12),
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
                              const Icon(
                                Icons.favorite_rounded,
                                color: primaryColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                favorites_count.toString(),
                                style: cardTitle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                regularDrink,
                                color: primaryColor,
                                height: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                regular_price.toString(),
                                style: cardTitle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                largeDrink,
                                color: primaryColor,
                                height: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                large_price.toString(),
                                style: cardTitle,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.EDIT_MENU, arguments: {
                        'id': id,
                        'name': name,
                        'regular_price': regular_price,
                        'large_price': large_price,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
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
          ]),
    );
  }
}
