import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolors.backgroundColor,
      centerTitle: true,
      title: Image.asset("assets/logo/Stylish.png", height: 40, width: 100),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Image.asset("assets/user/user.png"),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
