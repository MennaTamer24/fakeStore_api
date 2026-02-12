// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/product_controller.dart';
import 'package:fake_api_app/features/products/data/productModel.dart';
import 'package:fake_api_app/features/products/view/detalis_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateBtn extends StatelessWidget {
  UpdateBtn({
    super.key,
    required this.id,
    required this.titleController,
    required this.priceController,
    required this.categoryController,
    required this.imageController,
    required this.descController,
    this.formKey,
  });
  final ProductController controller = Get.find<ProductController>();
  final int id;
  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController categoryController;
  final TextEditingController imageController;
  final TextEditingController descController;
  final formKey;
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
                      final updatedProduct = ProductModel(
                        id: id,
                        title: titleController.text.trim(),
                        price: double.parse(priceController.text.trim()),
                        description: descController.text.trim(),
                        category: categoryController.text.trim(),
                        image: imageController.text.trim(),
                      );

                      final result = await controller.updateProduct(
                        updatedProduct,
                      );

                      if (result != null) {
                        Get.off(() => DetailsScreen(product: result));
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
          child: controller.updateLoading.value
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  "Update Product",
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
