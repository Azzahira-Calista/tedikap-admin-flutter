import 'package:flutter/material.dart';
import '../../../../../../common/themes.dart';

Widget customTab(String label, int badgeCount) {
  return Tab(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Text(
            label,
            style: const TextStyle(color: offColor),
          ),
        ),
        if (badgeCount > 0) ...[
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Center(
                child: Text(
                  badgeCount.toString(),
                  style: smallTextWhite,
                ),
              ),
            ),
          ),
        ],
      ],
    ),
  );
}
