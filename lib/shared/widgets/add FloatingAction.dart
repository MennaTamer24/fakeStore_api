// ignore_for_file: deprecated_member_use

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class AddFloatingAction extends StatelessWidget {
  const AddFloatingAction({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Appcolors.appColor.withOpacity(0.8),
      foregroundColor: Appcolors.backgroundColor,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
