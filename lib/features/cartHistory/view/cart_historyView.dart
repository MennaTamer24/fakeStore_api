// ignore_for_file: deprecated_member_use

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/cart_controller.dart';
import 'package:fake_api_app/features/cartHistory/view/add_newCart.dart';
import 'package:fake_api_app/features/cartHistory/widget/Dismiss_widret.dart';
import 'package:fake_api_app/features/cartHistory/widget/cart_card.dart';
import 'package:fake_api_app/shared/widgets/add%20FloatingAction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      floatingActionButton: AddFloatingAction(
        onPressed: () {
          Get.to(() => const AddCartView());
        },
      ),

      appBar: AppBar(
        backgroundColor: Appcolors.backgroundColor,
        title: const Text(
          'Carts History',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.carts.isEmpty) {
          return const Center(child: Text('No carts available'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.carts.length,
          itemBuilder: (context, index) {
            final cart = controller.carts[index];

            return DismissWidget(
              widget: CartCard(cart: cart),
              cart: cart,
            );
          },
        );
      }),
    );
  }
}
