// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/users_controller.dart';
import 'package:fake_api_app/features/users/data/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addelevatedbutton extends StatelessWidget {
  Addelevatedbutton({super.key, this.username, this.email, this.password});
  final controller = Get.find<UsersController>();
  final username;
  final email;
  final password;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Appcolors.appColor),
      onPressed: () {
        controller
            .addUser(
              UserModel(
                username: username.text,
                email: email.text,
                password: password.text,
              ),
            )
            .then((_) => Get.back());
      },
      child: const Text('Add User', style: TextStyle(color: Colors.white)),
    );
  }
}
