// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/product_controller.dart';
import 'package:fake_api_app/features/products/data/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewproductBtn extends StatelessWidget {
  AddNewproductBtn({
    super.key,
    this.titleController,
    this.priceController,
    this.categoryController,
    this.imageController,
    this.descController,
    this.formKey,
  });
  final titleController;
  final priceController;
  final categoryController;
  final imageController;
  final descController;
  final formKey;
  final ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolors.appColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: controller.addLoading.value
              ? null
              : () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      final product = ProductModel(
                        id: 21,
                        title: titleController.text.trim(),
                        price: double.parse(priceController.text),
                        description: descController.text.trim(),
                        category: categoryController.text.trim(),
                        image: imageController.text.trim(),
                      );

                      final result = await controller.addNewProduct(product);

                      if (result != null) {
                        Get.back();
                      }
                    } catch (e) {
                      Get.snackbar(
                        "Error",
                        "Invalid price value",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  }
                },
          child: controller.addLoading.value
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  "Add Product",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      );
    });
  }
}
