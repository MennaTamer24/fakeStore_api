import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/users_controller.dart';
import 'package:fake_api_app/features/users/widget/addElevatedButton.dart';
import 'package:fake_api_app/shared/widgets/custom_txtfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddUserView extends StatelessWidget {
  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UsersController>();
    final username = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.backgroundColor,
        title: const Text(
          'Add User',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTxtfield(
              controller: username,
              hint: 'Username',
              isPassword: false,
            ),
            Gap(15),
            CustomTxtfield(controller: email, hint: 'Email', isPassword: false),
            Gap(15),
            CustomTxtfield(
              controller: password,
              hint: 'Password',
              isPassword: true,
            ),
            Gap(20),
            Obx(
              () => controller.addLoading.value
                  ? const CircularProgressIndicator()
                  : Addelevatedbutton(
                      username: username,
                      email: email,
                      password: password,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
