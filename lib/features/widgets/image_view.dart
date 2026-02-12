// ignore_for_file: deprecated_member_use

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageView extends StatelessWidget {
  ImageView({super.key});
  final ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.imageUrl.value.isEmpty) {
        return Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Appcolors.appColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(child: Text("Image Preview")),
        );
      } else {
        return Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              controller.imageUrl.value,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Appcolors.appColor.withOpacity(0.1),
                  child: const Center(child: Text("Invalid Image URL")),
                );
              },
            ),
          ),
        );
      }
    });
  }
}
