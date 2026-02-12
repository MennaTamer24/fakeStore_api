import 'package:fake_api_app/features/cartHistory/cart_model.dart';

List<CartModel> mockCarts = [
  CartModel(
    id: 1,
    userId: 101,
    products: [
      CartItem(productId: 1, quantity: 2),
      CartItem(productId: 2, quantity: 1),
    ],
  ),
  CartModel(
    id: 2,
    userId: 202,
    products: [CartItem(productId: 3, quantity: 1)],
  ),
];
