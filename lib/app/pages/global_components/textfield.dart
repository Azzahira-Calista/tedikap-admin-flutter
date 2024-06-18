import 'package:flutter/material.dart';
import 'package:tedikap_admin/common/themes.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.name,
    required this.height,
    required this.obsecureText,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String hintText;
  final String name;
  final double height;
  final bool obsecureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: subTitle,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 5),
          Container(
            height: height,
            child: TextFormField(
              obscureText: obsecureText,
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: primaryColor),
                ),
                hintText: hintText,
                hintStyle: hint,
                focusColor: primaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: offColor),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
