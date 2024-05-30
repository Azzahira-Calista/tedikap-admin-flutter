import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../../../common/constant.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                logoTedikap,
                width: 55,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.05,
              ),
              Text(
                "Selamat datang, Admin",
                style: appBarText,
              ),
            ],
          ),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.TAMBAH_NOTIF);
              },
              child: SvgPicture.asset(
                notifIcon,
                width: 36,
              ))
        ],
      ),
    );
  }
}
