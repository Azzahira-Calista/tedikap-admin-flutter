import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/themes.dart';

class CrudButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String routeName;

  CrudButton({
    required this.title,
    required this.iconData,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                title,
                style: headline.copyWith(color: white, fontSize: 25),
              ),
            ),
            Icon(iconData, color: white, size: 50),
          ],
        ),
      ),
    );
  }
}
