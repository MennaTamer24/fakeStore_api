import 'package:fake_api_app/features/products/data/productModel.dart';
import 'package:fake_api_app/features/products/data/product_repo.dart';
import 'package:fake_api_app/shared/helpers/custom_snack.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool addLoading = false.obs;
  RxBool updateLoading = false.obs;
  RxBool deleteLoading = false.obs;

  RxList<ProductModel> productList = <ProductModel>[].obs;

  RxList<ProductModel> selectedProducts = <ProductModel>[].obs;
  RxDouble totalCost = 0.0.obs;
  RxInt productCounter = 0.obs;

  final RxString imageUrl = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final products = await ProductRepo().getAllProducts();
      productList.assignAll(products);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      customSnack(e.toString());
    }
  }

  Future<ProductModel?> addNewProduct(ProductModel product) async {
    addLoading(true);
    try {
      final newProduct = await ProductRepo().AddNewProduct(product);
      if (newProduct != null) {
        productList.add(newProduct);
      }
      addLoading(false);
      return newProduct;
    } catch (e) {
      addLoading(false);
      customSnack(e.toString());
      return null;
    }
  }

  Future<ProductModel?> updateProduct(ProductModel product) async {
    updateLoading(true);
    try {
      final response = await ProductRepo().updateNewProduct(product);

      if (response != null) {
        final index = productList.indexWhere((p) => p.id == response.id);
        if (index != -1) {
          productList[index] = response;
        }
      }

      updateLoading(false);
      return response;
    } catch (e) {
      updateLoading(false);
      customSnack(e.toString());
      return null;
    }
  }

  Future<bool> deleteProduct(ProductModel product) async {
    deleteLoading(true);
    try {
      await ProductRepo().deleteProduct(product.id.toString());

      productList.removeWhere((p) => p.id == product.id);

      selectedProducts.removeWhere((p) => p.id == product.id);
      productCounter.value = selectedProducts.length;

      double sum = 0;
      for (var item in selectedProducts) {
        sum += item.price;
      }
      totalCost.value = double.parse(sum.toStringAsFixed(2));

      deleteLoading(false);
      return true;
    } catch (e) {
      deleteLoading(false);
      customSnack(e.toString());
      return false;
    }
  }

  void addToCart(ProductModel product) {
    if (!selectedProducts.contains(product)) {
      selectedProducts.add(product);
      productCounter.value = selectedProducts.length;
      double sum = 0;
      for (var item in selectedProducts) {
        sum += item.price;
      }
      totalCost.value = double.parse(sum.toStringAsFixed(2));
    }
  }

  Future<ProductModel?> getSingleProduct(String id) async {
    try {
      return await ProductRepo().getSingleProduct(id);
    } catch (e) {
      customSnack(e.toString());
      return null;
    }
  }
}
