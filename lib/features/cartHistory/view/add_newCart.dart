import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/features/cartHistory/widget/addCartElevatedBtn.dart';
import 'package:fake_api_app/shared/widgets/custom_txtfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddCartView extends StatelessWidget {
  const AddCartView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<CartController>();

    final formKey = GlobalKey<FormState>();

    final userIdController = TextEditingController();
    final productIdController = TextEditingController();
    final quantityController = TextEditingController();

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(title: const Text('Add New Cart'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add New Cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(20),

                    CustomTxtfield(
                      hint: 'User ID',
                      isPassword: false,
                      controller: userIdController,
                    ),
                    Gap(12),

                    CustomTxtfield(
                      hint: 'Product ID',
                      isPassword: false,
                      controller: productIdController,
                    ),
                    Gap(12),

                    CustomTxtfield(
                      hint: 'Quantity',
                      isPassword: false,
                      controller: quantityController,
                    ),
                    Gap(30),

                    Addcartelevatedbtn(
                      formKey: formKey,
                      userIdController: userIdController,
                      productIdController: productIdController,
                      quantityController: quantityController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
