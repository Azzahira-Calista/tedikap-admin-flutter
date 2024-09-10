import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/pages/feature_pages/menu_page/menu_controller.dart';
import '../../../../../common/themes.dart';

class MenuFilter extends GetView<MenusController> {
  final List<String> options = ['tea', 'nontea', 'yakult'];

  MenuFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChipsChoice<int>.single(
        value: controller.currentIndex.value,
        onChanged: (val) {
          controller.currentIndex.value = val;
          controller.updateCategory(options[val]);
        },
        choiceItems: C2Choice.listFrom<int, String>(
          source: options,
          value: (i, v) => i,
          label: (i, v) => v,
        ),
        choiceStyle: C2ChipStyle.outlined(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          foregroundStyle: subTitle.copyWith(color: offColor),
          color: offColor,
          // avatarForegroundColor: Colors.black12,
          borderStyle: BorderStyle.solid,
          // borderOpacity: 0.3,
          selectedStyle: C2ChipStyle(
            backgroundColor: backgroundColor,
            checkmarkColor: primaryColor,
            checkmarkStyle: C2ChipCheckmarkStyle.round,
            foregroundStyle: subTitle.copyWith(color: primaryColor),
            borderRadius: const BorderRadius.all(
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
