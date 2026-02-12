import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/features/products/data/productModel.dart';
import 'package:fake_api_app/core/controllers/product_controller.dart';

class ConfirmDelete extends StatelessWidget {
  final ProductModel product;
  const ConfirmDelete({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return AlertDialog(
      title: const Text("Delete Product"),
      content: const Text("Are you sure you want to delete this product?"),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text("No")),
        Obx(
          () => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.appColor,
            ),
            onPressed: productController.deleteLoading.value
                ? null
                : () async {
                    bool success = await productController.deleteProduct(
                      product,
                    );
                    if (success) {
                      Get.back();
                    }
                  },
            child: productController.deleteLoading.value
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text("Yes", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
