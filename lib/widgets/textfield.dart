import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tedikap_admin/themes.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    // required this.screenWidth,
    // required this.screenHeight,
    // required this.controller,
    required this.hintText,
    required this.name,
  });

  // final double screenWidth;
  // final double screenHeight;
  // final TextEditingController controller;
  final String hintText;
  final String name;

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
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       border: Border.all(color: offColor)),
          //   child: Text(
          //     hintText,
          //     textAlign: TextAlign.start,
          //     style: hint,
          //   ),
          // ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: offColor),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
