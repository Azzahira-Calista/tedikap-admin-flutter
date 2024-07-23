import 'package:flutter/material.dart';
import 'package:tedikap_admin/common/themes.dart';

class EarningsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.25,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Sales',
                    style: subTitle,
                  ),
                  Text(
                    "Rp " + "350.000",
                    style: headline,
                  )
                ],
              ),
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
                        Text("Avg Per Week",
                            style: normalText.copyWith(color: darkGrey)),
                        Text("Rp " + "100.000",
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
                        Text("Earnings Growth",
                            style: normalText.copyWith(color: darkGrey)),
                        Text("75 " + "%",
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
