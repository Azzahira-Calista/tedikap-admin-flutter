import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class PromoBanner extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final String image;
  final double discount;
  final int max_discount;
  final int min_transaction;
  final String start_date;
  final String end_date;

  PromoBanner({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.discount,
    required this.max_discount,
    required this.min_transaction,
    required this.start_date,
    required this.end_date,
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
                          "https://tedikap-api.rplrus.com/storage/voucher/$image")
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(title,
                          overflow: TextOverflow.ellipsis,
                          style: normalText.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.EDIT_VOUCHER, arguments: {
                          'id': id,
                          'title': title,
                          'description': description,
                          'image': image,
                          'discount': discount,
                          'min_transaction': min_transaction,
                          'max_discount': max_discount,
                          'start_date': start_date,
                          'end_date': end_date,
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
                  description,
                  style: cardTitle,
                ),
                SizedBox(height: 5),
                Text(
                  'Discount: $discount%',
                  style: cardTitle,
                ),
                SizedBox(height: 5),
                Text('Max Discount: $max_discount', style: cardTitle),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Min transaction: Rp$min_transaction',
                      style: cardTitle,
                    ),
                    Text(
                      'Valid until $end_date',
                      style: cardTitle,
                    ),
                    // Text(
                    //   'Code: $id',
                    //   style: TextStyle(),
                    // ),
                  ],
                ),
                // if (maxDiscount != null)
                //   Text(
                //     'Max Discount: $maxDiscount',
                //     style: TextStyle(),
                //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
