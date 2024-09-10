// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/format.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../../data/model/promo/promo_model.dart';

class PromoBanner extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final int discount;
  final String start_date;
  final String end_date;
  final List<Products>? promoItems;

  const PromoBanner({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.start_date,
    required this.end_date,
    required this.promoItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
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
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: normalText.copyWith(
                          fontWeight: FontWeight.bold,
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
                  'Discount: ${formatRupiah(discount)}',
                  style: smallText,
                ),
                const SizedBox(height: 5),
                if (promoItems != null && promoItems!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: promoItems!.map((product) {
                      return Text('Product: ${product.name ?? 'No product'}'
                        ,
                        style: smallText,
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valid from: ${DateFormat('yyyy MMM dd').format(DateTime.parse(start_date))}',
                      style: smallText.copyWith(
                        color: darkGrey,
                      ),
                    ),
                    Text(
                      'Valid until: ${DateFormat('yyyy MMM dd').format(DateTime.parse(end_date))}',
                      style: smallText.copyWith(
                        color: darkGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


