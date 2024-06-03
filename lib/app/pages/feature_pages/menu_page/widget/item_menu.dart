import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../../routes/AppPages.dart';

class ItemWidget extends StatelessWidget {
  final String description;
  final String title;
  final int price;
  final String image;
  final int id;

  ItemWidget({
    required this.title,
    required this.price,
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
              Get.toNamed(Routes.DETAIL_MENU, arguments: {
                'id': id,
                'name': title,
                // 'price': int.parse(price.toString()),
                'price': price,
                'image': image,
                'description': description,
              });
            },
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://tedikap-api.rplrus.com/storage/product/$image"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.19,
                        child: Text(
                          title,
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
                            price.toString(),
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
              Get.toNamed(Routes.EDIT_MENU);
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
