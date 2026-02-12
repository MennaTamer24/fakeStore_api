import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/cart_controller.dart';
import 'package:fake_api_app/features/cartHistory/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addcartelevatedbtn extends StatelessWidget {
  Addcartelevatedbtn({
    super.key,
    required this.formKey,
    required this.userIdController,
    required this.productIdController,
    required this.quantityController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userIdController;
  final TextEditingController productIdController;
  final TextEditingController quantityController;

  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolors.appColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: controller.addLoading.value
              ? null
              : () {
                  if (!formKey.currentState!.validate()) return;

                  final newCart = CartModel(
                    id: (DateTime.now().millisecondsSinceEpoch % 150) + 1,
                    userId: int.parse(userIdController.text),
                    products: [
                      CartItem(
                        productId: int.parse(productIdController.text),
                        quantity: int.parse(quantityController.text),
                      ),
                    ],
                  );

                  controller.addNewCart(newCart);
                  Get.back();
                },
          child: controller.addLoading.value
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  'Add Cart',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}
