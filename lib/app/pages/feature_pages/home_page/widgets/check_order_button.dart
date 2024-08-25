import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../../common/constant.dart';
import '../../../../../routes/AppPages.dart';

class CheckOrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ORDER);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        height: 64,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: cream),
                  child: Stack(children: [
                    SvgPicture.asset(
                      orderIcon,
                      width: 25,
                      height: 25,
                    ),
                    Positioned(
                      right: 0,
                      top: -4,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, color: red),
                        child: Text(
                          "2",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.02,
                ),
                Text(
                  "New orders",
                  style: appBarText,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Manage order",
                  style: normalText,
                ),
                Icon(Icons.keyboard_arrow_right)
              ],
            )
          ],
        ),
      ),
    );
  }
}
