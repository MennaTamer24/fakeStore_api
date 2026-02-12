import 'package:fake_api_app/core/controllers/cart_controller.dart';
import 'package:fake_api_app/features/cartHistory/cart_model.dart';
import 'package:fake_api_app/features/cartHistory/view/UpdateCartView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DismissWidget extends StatelessWidget {
  DismissWidget({super.key, required this.widget, required this.cart});
  final Widget widget;
  final CartModel cart;
  final CartController controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cart.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        controller.deleteCart(cart);
        Get.snackbar(
          'Deleted',
          'Cart ${cart.id} removed',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: GestureDetector(
        onTap: () {
          Get.to(() => UpdateCartView(cart: cart));
        },

        child: widget,
      ),
    );
  }
}
