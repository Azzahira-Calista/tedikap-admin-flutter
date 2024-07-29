import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_voucher/edit_voucher_controller.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/themes.dart';
import '../../../../../routes/AppPages.dart';

class BoxPromo extends GetView<EditVoucherController> {
  
  final int id;
  final String title;
  final String subtitle;
  final String image;

  BoxPromo({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              editIcon,
                              color: Colors.white,
                            ),
                            // Icon(Icons.edit, color: Colors.white, size: 15),
                            SizedBox(width: 5),
                            Text("Edit", style: smallTextWhite),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: cardTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
