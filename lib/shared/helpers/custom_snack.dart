import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../core/constants/custom_text.dart';

SnackBar customSnack(errorMsg) {
  return SnackBar(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.only(bottom: 30, right: 20, left: 20),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red.shade900,
    content: FittedBox(
      child: Row(
        children: [
          Gap(14),
          CustomText(
            text: errorMsg,
            color: Colors.white,
            size: 10,
            weight: FontWeight.w600,
          ),
        ],
      ),
    ),
  );
}
