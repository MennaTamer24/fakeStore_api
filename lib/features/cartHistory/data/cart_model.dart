import 'package:fake_api_app/features/products/data/productModel.dart';

class CartModel {
  final int id;
  final int userId;
  final List<CartItem> products;

  CartModel({required this.id, required this.userId, required this.products});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      products: List<CartItem>.from(
        json['products'].map((item) => CartItem.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'products': products.map((e) => e.toJson()).toList(),
    };
  }
}

class CartItem {
  final int productId;
  final int quantity;

  CartItem({required this.productId, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(productId: json['productId'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }
}
