import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/cart_controller.dart';
import 'package:fake_api_app/features/cartHistory/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Updatecartelevatedbtn extends StatelessWidget {
  Updatecartelevatedbtn({
    super.key,
    required this.formKey,
    required this.id,
    required this.userIdController,
    required this.products,
  });

  final GlobalKey<FormState> formKey;
  final int id;
  final TextEditingController userIdController;
  final List<CartItem> products;

  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Appcolors.appColor,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: controller.updateLoading.value
              ? null
              : () async {
                  if (formKey.currentState!.validate()) {
                    final updatedCart = CartModel(
                      id: id,
                      userId: int.parse(userIdController.text),
                      products: products,
                    );

                    await controller.updateCart(updatedCart);
                    Get.back();
                  }
                },
          child: controller.updateLoading.value
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  'Update Cart',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}
