import 'package:fake_api_app/features/cartHistory/cart_model.dart';
import 'package:fake_api_app/features/cartHistory/data/cart_repo.dart';
import 'package:fake_api_app/shared/helpers/custom_snack.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepository cartRepository = CartRepository();
  RxList<CartModel> carts = <CartModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool addLoading = false.obs;
  RxBool updateLoading = false.obs;
  RxBool deleteLoading = false.obs;
  @override
  void onInit() {
    fetchCarts();
    super.onInit();
  }

  Future<void> fetchCarts() async {
    try {
      isLoading(true);
      final fetchedCarts = await cartRepository.getAllCarts();
      carts.assignAll(fetchedCarts);
    } catch (e) {
      isLoading(false);
      customSnack(e.toString());
    }
  }

  Future<CartModel?> addNewCart(CartModel cart) async {
    try {
      addLoading(true);
      final newCart = await cartRepository.addNewCart(cart);
      carts.add(newCart);
      addLoading(false);
      return newCart;
    } catch (e) {
      addLoading(false);
      customSnack(e.toString());
      return null;
    }
  }

  Future<CartModel?> updateCart(CartModel cart) async {
    try {
      updateLoading(true);
      final updatedCart = await cartRepository.updateCart(cart);
      final index = carts.indexWhere((c) => c.id == updatedCart.id);
      if (index != -1) {
        carts[index] = updatedCart;
      }
      updateLoading(false);
      return updatedCart;
    } catch (e) {
      updateLoading(false);
      customSnack(e.toString());
      return null;
    }
  }

  Future<void> deleteCart(CartModel cart) async {
    try {
      deleteLoading(true);
      await cartRepository.deleteCart(cart.id.toString());
      carts.removeWhere((c) => c.id == cart.id);
      deleteLoading(false);
    } catch (e) {
      deleteLoading(false);
      customSnack(e.toString());
    }
  }
}
// import 'package:fake_api_app/features/cartHistory/cart_model.dart';
// import 'package:fake_api_app/features/cartHistory/data/cart_repo.dart';
// import 'package:fake_api_app/shared/helpers/custom_snack.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   final CartRepository cartRepository = CartRepository();

//   RxList<CartModel> carts = <CartModel>[].obs;
//   RxBool isLoading = false.obs;
//   RxBool addLoading = false.obs;
//   RxBool updateLoading = false.obs;
//   RxBool deleteLoading = false.obs;

//   @override
//   void onInit() {
//     fetchCarts();
//     super.onInit();
//   }

//   Future<void> fetchCarts() async {
//     try {
//       isLoading(true);
//       final fetchedCarts = await cartRepository.getAllCarts();
//       carts.assignAll(fetchedCarts);
//     } catch (e) {
//       customSnack(e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<CartModel?> addNewCart(CartModel cart) async {
//     try {
//       addLoading(true);
//       final newCart = await cartRepository.addNewCart(cart);
//       carts.add(newCart);
//       return newCart;
//     } catch (e) {
//       customSnack(e.toString());
//       return null;
//     } finally {
//       addLoading(false);
//     }
//   }

//   Future<CartModel?> updateCart(CartModel cart) async {
//     try {
//       updateLoading(true);
//       final updatedCart = await cartRepository.updateCart(cart);
//       final index = carts.indexWhere((c) => c.id == updatedCart.id);
//       if (index != -1) {
//         carts[index] = updatedCart;
//       }
//       return updatedCart;
//     } catch (e) {
//       customSnack(e.toString());
//       return null;
//     } finally {
//       updateLoading(false);
//     }
//   }

//   Future<void> deleteCart(CartModel cart) async {
//     try {
//       deleteLoading(true);
//       await cartRepository.deleteCart(cart.id.toString());
//       carts.removeWhere((c) => c.id == cart.id);
//     } catch (e) {
//       customSnack(e.toString());
//     } finally {
//       deleteLoading(false);
//     }
//   }
// }
