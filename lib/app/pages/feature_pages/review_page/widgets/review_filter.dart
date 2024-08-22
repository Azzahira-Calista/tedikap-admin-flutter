import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/review_controller.dart';
import 'package:tedikap_admin/common/themes.dart';

class ReviewFilter extends GetView<ReviewController> {
  final List<Map<String, dynamic>> options = [
    {'label': 'All', 'value': 0},
    {'label': '1⭐', 'value': 1},
    {'label': '2⭐', 'value': 2},
    {'label': '3⭐', 'value': 3},
    {'label': '4⭐', 'value': 4},
    {'label': '5⭐', 'value': 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChipsChoice<int>.single(
        value: controller.currentIndex.value,
        onChanged: (val) {
          controller.currentIndex.value = val;
          controller.updateRating(options[val]['value']);
        },
        choiceItems: C2Choice.listFrom<int, Map<String, dynamic>>(
          source: options,
          value: (i, v) => i,
          label: (i, v) => v['label'],
        ),
        choiceStyle: C2ChipStyle.outlined(
          padding: EdgeInsets.symmetric(horizontal: 10),
          borderRadius: BorderRadius.all(
            Radius.circular(35),
          ),
          foregroundStyle: subTitle.copyWith(color: offColor),
          color: offColor,
          selectedStyle: C2ChipStyle(
            backgroundColor: Colors.black,
            checkmarkColor: primaryColor,
            checkmarkStyle: C2ChipCheckmarkStyle.round,
            foregroundStyle: subTitle.copyWith(color: primaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            borderColor: primaryColor,
            borderWidth: 1,
          ),
        ),
      ),
    );
  }
}
