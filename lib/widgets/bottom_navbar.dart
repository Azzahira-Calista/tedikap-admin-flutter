import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tedikap_admin/themes.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 20),
      height: 82,
      decoration: BoxDecoration(color: white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 15,
          offset: Offset(0, -2),
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                homeIcon,
                color: offColor,
                width: 50,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                drinkIcon,
                color: offColor,
                width: 50,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                chatIcon,
                color: offColor,
                width: 50,
              ))
        ],
      ),
    );
  }
}
