import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class PromoBanner extends StatelessWidget {
  // final int id;
  // final String title;
  // final String description;
  // final String image;
  // final double discount;
  // final int max_discount;
  // final int min_transaction;
  // final String start_date;
  // final String end_date;

  // PromoBanner({
  //   required this.id,
  //   required this.title,
  //   required this.description,
  //   required this.image,
  //   required this.discount,
  //   required this.max_discount,
  //   required this.min_transaction,
  //   required this.start_date,
  //   required this.end_date,
  // });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        // height: 250,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: white,
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
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: NetworkImage(
                //         "https://tedikap-api.rplrus.com/storage/promo/$image"),
                //     fit: BoxFit.cover),
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                // image: DecorationImage(
                //   image: AssetImage('assets/images/voucher_banner.jpg'),
                //   fit: BoxFit.cover,
                // ),
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
                      Text(
                        'Voucher Name',
                        style: normalText.copyWith(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.EDIT_PROMO);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(editIcon),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Edit", style: smallTextWhite),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.65,
                    ),
                    child: Text(
                      'Voucher Description Voucher Description Voucher Description Voucher Description',
                      style: normalText,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Valid until 12 june 2024',
                        style: normalText,
                      ),
                      Text(
                        'Code: 123456',
                        style: normalText,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
