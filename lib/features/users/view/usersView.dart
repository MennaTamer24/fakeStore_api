// ignore_for_file: deprecated_member_use

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/users_controller.dart';
import 'package:fake_api_app/features/users/view/addUserView.dart';

import 'package:fake_api_app/shared/widgets/add%20FloatingAction.dart';
import 'package:fake_api_app/features/users/widget/userCard.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ================= USERS LIST PAGE =================
class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UsersController());

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.backgroundColor,
        title: const Text(
          'Users',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: AddFloatingAction(
        onPressed: () => Get.to(() => const AddUserView()),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: controller.allUsers.length,
            itemBuilder: (context, index) {
              final user = controller.allUsers[index];
              return Usercard(user: user, controller: controller);
            },
          ),
        );
      }),
    );
  }
}
