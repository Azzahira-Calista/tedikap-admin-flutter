// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/themes.dart';

import '../router/pages.dart';

class MyChat extends StatelessWidget {
  const MyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.CHAT_ROOM);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        margin: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Admin",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Hello, how can I help you?",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text("17.30")
          ],
        ),
      ),
    );
  }
}