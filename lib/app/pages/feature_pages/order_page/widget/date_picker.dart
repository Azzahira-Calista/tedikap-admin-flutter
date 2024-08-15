import 'package:flutter/material.dart';
import 'package:tedikap_admin/common/themes.dart';

class DatePickerWidget extends StatelessWidget {
  final String text;
  final TextEditingController controllers;
  final VoidCallback onTap;

  DatePickerWidget({
    Key? key,
    required this.text,
    required this.controllers,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.1,
      width: width * 0.4,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: lightGrey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: normalText,
              ),
              Container(
                width: width * 0.25,
                height: height * 0.05,
                child: TextField(
                  controller: controllers,
                  keyboardType: TextInputType.datetime,
                  onTap: () {
                    Future.delayed(Duration(milliseconds: 100), () {
                      onTap();
                    });
                  },
                  readOnly: true,
                  style: normalText,
                  decoration: InputDecoration(
                    // labelStyle: smallText,
                    hintText: 'Select Date',
                    hintStyle: normalText,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Icon(Icons.calendar_month, color: primaryColor),
        ],
      ),
    );
  }
}
