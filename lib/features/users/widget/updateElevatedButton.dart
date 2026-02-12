// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/users_controller.dart';
import 'package:fake_api_app/features/users/data/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Updateelevatedbutton extends StatelessWidget {
  Updateelevatedbutton({super.key, this.username, this.email, this.password, this.user});
 final controller = Get.find<UsersController>();
  final username;
  final email;
  final password;
  final user;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Appcolors.appColor),
      onPressed: () {
        controller
            .updateUser(
              UserModel(
                id: user.id,
                username: username.text,
                email: email.text,
                password: password.text,
              ),
            )
            .then((_) => Get.back());
      },
      child: const Text('Update User', style: TextStyle(color: Colors.white)),
    );
  }
}
