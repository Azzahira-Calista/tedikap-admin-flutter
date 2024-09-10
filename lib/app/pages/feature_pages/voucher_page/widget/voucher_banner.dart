// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/format.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class VoucherBanner extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final String image;
  final int discount;
  final int max_discount;
  final int min_transaction;
  final String start_date;
  final String end_date;

  const VoucherBanner({
    super.key,
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
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 1,
        //     blurRadius: 5,
        //     offset: const Offset(0, 3),
        //   ),
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
                          "https://tedikap-api.rplrus.com/storage/voucher/$image")
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
                    SizedBox(
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
                              color: Colors.white,
                            ),
                            // Icon(Icons.edit, color: Colors.white, size: 15),
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
                  description,
                  style: smallText,
                ),
                const SizedBox(height: 5),
                Text(
                  'Discount: $discount%',
                  style: smallText,
                ),
                const SizedBox(height: 5),
                Text('Max Discount: ${formatRupiah(max_discount)}',
                    style: smallText),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Min transaction: ${formatRupiah(min_transaction)}',
                      style: smallText,
                    ),
                    Text(
                        'Valid until: ${DateFormat('yyyy MMM dd').format(DateTime.parse(end_date))}',
                        style: smallText.copyWith(
                          color: darkGrey,
                        )),
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
