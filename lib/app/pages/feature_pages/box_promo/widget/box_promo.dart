import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/box_promo/box_promo_controller.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/themes.dart';
import '../../../../../routes/AppPages.dart';

class BoxPromo extends GetView<BoxPromoController> {
  final int id;
  final String title;
  final String subtitle;
  final String image;

  const BoxPromo({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        // BoxShadow(
        //   color: Colors.grey.withOpacity(0.5),
        //   spreadRadius: 1,
        //   blurRadius: 5,
        //   offset: const Offset(0, 3),
        // ),
        // ],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                          "https://tedikap-api.rplrus.com/storage/box-promo/$image")
                      as ImageProvider,
                  fit: BoxFit.cover),
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: normalText.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.EDIT_BOX_PROMO, arguments: {
                          'id': id,
                          'title': title,
                          'subtitle': subtitle,
                          'image': image,
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              editIcon,
                              // ignore: deprecated_member_use
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Text("Edit", style: smallTextWhite),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: smallText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
