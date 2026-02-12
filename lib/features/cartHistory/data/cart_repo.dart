// import 'package:dio/dio.dart';
// import 'package:fake_api_app/core/errors/api_error.dart';
// import 'package:fake_api_app/core/errors/api_exceptions.dart';
// import 'package:fake_api_app/core/network/api_services.dart';
// import 'package:fake_api_app/features/cartHistory/cart_model.dart';

// class CartRepository {
//   final ApiService apiService = ApiService();
//   Future<List<CartModel>> getAllCarts() async {
//     try {
//       final response = await apiService.get('carts');
//       return List<CartModel>.from(
//         response.map((item) => CartModel.fromJson(item)),
//       );
//     } on DioException catch (e) {
//       throw ApiExceptions.handleError(e);
//     } catch (e) {
//       throw ApiError(message: e.toString());
//     }
//   }
// //===================== Get Single Cart ===================//
//  Future<CartModel>getASingleCart(String id) async {
//     try {
//       final response = await apiService.get('carts/$id');
//       return CartModel.fromJson(response);
//     } on DioException catch (e) {
//       throw ApiExceptions.handleError(e);
//     } catch (e) {
//       throw ApiError(message: e.toString());
//     }
//   }
//   //===================== Add New Cart ===================//
//  Future<CartModel> addNewCart(CartModel cart) async {
//     try {
//       final response = await apiService.post('carts', cart.toJson());
//       return CartModel.fromJson(response);
//     } on DioException catch (e) {
//       throw ApiExceptions.handleError(e);
//     } catch (e) {
//       throw ApiError(message: e.toString());
//     }
//   }
//   //===================== Update Cart ===================//
//  Future<CartModel> updateCart(CartModel cart) async {
//     try {
//       final response = await apiService.put(
//         'carts/${cart.id}',
//         cart.toJson(),
//       );
//       return CartModel.fromJson(response);
//     } on DioException catch (e) {
//       throw ApiExceptions.handleError(e);
//     } catch (e) {
//       throw ApiError(message: e.toString());
//     }
//   }
//   //===================== Delete Cart ===================//
//  Future<void> deleteCart(String id) async {
//     try {
//       await apiService.delete('carts/$id');
//     } on DioException catch (e) {
//       throw ApiExceptions.handleError(e);
//     } catch (e) {
//       throw ApiError(message: e.toString());
//     }
//   }
// }
import 'package:fake_api_app/features/cartHistory/cart_model.dart';
import 'package:fake_api_app/features/cartHistory/data/mock.dart';

class CartRepository {
  Future<List<CartModel>> getAllCarts() async {
    // محاكاة تحميل البيانات
    await Future.delayed(const Duration(seconds: 1));
    return mockCarts;
  }

  Future<CartModel> addNewCart(CartModel cart) async {
    await Future.delayed(const Duration(seconds: 1));
    mockCarts.add(cart);
    return cart;
  }

  Future<CartModel> updateCart(CartModel cart) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = mockCarts.indexWhere((c) => c.id == cart.id);
    if (index != -1) {
      mockCarts[index] = cart;
    }
    return cart;
  }

  Future<void> deleteCart(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    mockCarts.removeWhere((c) => c.id.toString() == id);
  }
}
