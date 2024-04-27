import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedikap_admin/themes.dart';

class myButton extends StatelessWidget {
  const myButton({
    super.key,
    // required this.controller,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
  });

  // final controller;
  final String text;
  final onPressed;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: button),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

class myButtonLogo extends StatelessWidget {
  const myButtonLogo({
    super.key,
    // required this.controller,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
    required this.logo,
  });

  // final controller;
  final String text;
  final onPressed;
  final Color color;
  final Color textColor;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                logo,
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(text, style: button2),
            ],
          ),
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(color),
          //   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //     RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //   ),
          // ),
          style: ElevatedButton.styleFrom(
              // primary: Colors.transparent,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              foregroundColor: textColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: offColor, width: 1))),
        ));
  }
}
