// ignore_for_file: deprecated_member_use

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/product_controller.dart';
import 'package:fake_api_app/features/widgets/add_newProduct_btn.dart';
import 'package:fake_api_app/features/widgets/data_card.dart';
import 'package:fake_api_app/features/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descController = TextEditingController();
  final categoryController = TextEditingController();
  final imageController = TextEditingController();

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    imageController.addListener(() {
      controller.imageUrl.value = imageController.text.trim();
    });

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        title: const Text("Add New Product"),
        backgroundColor: Appcolors.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ImageView(),
              Gap(16),

              DataCard(
                titleController: titleController,
                priceController: priceController,
                categoryController: categoryController,
                imageController: imageController,
                descController: descController,
              ),

              Gap(30),
              AddNewproductBtn(
                titleController: titleController,
                priceController: priceController,
                categoryController: categoryController,
                imageController: imageController,
                descController: descController,
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
