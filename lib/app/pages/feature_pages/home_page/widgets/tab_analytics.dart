import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/sales_grafic.dart';

import '../../../../../common/themes.dart';

class AnalyticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            
            SalesGrafic(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            Container(
              width: screenWidth,
              height: screenHeight * 0.1,
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth * 0.44,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Income",
                            style: normalText.copyWith(color: darkGrey)),
                        Text("+ " + "100.000",
                            style: cardText.copyWith(
                                fontSize: 20, color: darkGrey)),
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.44,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      color: lightGrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Product Sales",
                            style: normalText.copyWith(color: darkGrey)),
                        Text("30 " + "Pcs",
                            style: cardText.copyWith(
                                fontSize: 20, color: darkGrey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
