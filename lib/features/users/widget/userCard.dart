// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/features/users/view/updateUserView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Usercard extends StatelessWidget {
  const Usercard({super.key, required this.user, required this.controller});
  final user;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appcolors.cardColor,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.person, color: Appcolors.appColor),
        title: Text(user.username),
        subtitle: Text(user.email),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Appcolors.appColor),
              onPressed: () => Get.to(() => UpdateUserView(user: user)),
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 101, 25, 20),
              ),
              onPressed: () => controller.deleteUser(user),
            ),
          ],
        ),
      ),
    );
  }
}
