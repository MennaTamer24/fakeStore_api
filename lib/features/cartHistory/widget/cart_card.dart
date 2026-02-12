import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/features/cartHistory/cart_model.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.cart});
  final CartModel cart;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        color: Appcolors.cardColor,
        elevation: 6,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Row(
            children: [
              const Icon(Icons.shopping_cart, color: Appcolors.appColor),
              const SizedBox(width: 8),
              Text(
                'Cart #${cart.id}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          subtitle: Text(
            'User ID: ${cart.userId}',
            style: const TextStyle(color: Color.fromARGB(255, 47, 46, 46)),
          ),
          trailing: const Icon(Icons.edit, color: Appcolors.appColor),
          children: cart.products.map((item) {
            return ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: Text('Product ID: ${item.productId}'),
              subtitle: Text('Quantity: ${item.quantity}'),
            );
          }).toList(),
        ),
      ),
    );
  }
}
