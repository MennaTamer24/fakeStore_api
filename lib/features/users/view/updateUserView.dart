import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/users_controller.dart';
import 'package:fake_api_app/features/users/data/userModel.dart';
import 'package:fake_api_app/features/users/widget/updateElevatedButton.dart';
import 'package:fake_api_app/shared/widgets/custom_txtfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class UpdateUserView extends StatelessWidget {
  final UserModel user;
  const UpdateUserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UsersController>();
    final username = TextEditingController(text: user.username);
    final email = TextEditingController(text: user.email);
    final password = TextEditingController(text: user.password);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.backgroundColor,
        title: const Text(
          'Update User',
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
            const SizedBox(height: 20),
            Obx(
              () => controller.updateLoading.value
                  ? const CircularProgressIndicator()
                  : Updateelevatedbutton(
                      username: username,
                      email: email,
                      password: password,
                      user: user,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
