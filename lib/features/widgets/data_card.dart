// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/shared/widgets/custom_txtfield.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard({
    super.key,
    this.titleController,
    this.priceController,
    this.categoryController,
    this.imageController,
    this.descController,
  });
  final titleController;
  final priceController;
  final categoryController;
  final imageController;
  final descController;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Appcolors.appColor),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTxtfield(
              hint: "Product Title",
              isPassword: false,
              controller: titleController,
            ),
            const SizedBox(height: 12),

            CustomTxtfield(
              hint: "Price",
              isPassword: false,
              controller: priceController,
            ),
            const SizedBox(height: 12),

            CustomTxtfield(
              hint: "Category",
              isPassword: false,
              controller: categoryController,
            ),
            const SizedBox(height: 12),

            CustomTxtfield(
              hint: "Image URL",
              isPassword: false,
              controller: imageController,
            ),
            const SizedBox(height: 12),

            CustomTxtfield(
              hint: "Description",
              isPassword: false,
              controller: descController,
            ),
          ],
        ),
      ),
    );
  }
}
