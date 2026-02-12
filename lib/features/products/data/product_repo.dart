// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:fake_api_app/core/errors/api_error.dart';
import 'package:fake_api_app/core/errors/api_exceptions.dart';
import 'package:fake_api_app/core/network/api_services.dart';
import 'package:fake_api_app/features/products/data/productModel.dart';

class ProductRepo {
  final ApiService apiService = ApiService();
  //===================== Product Methods ===================//
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await apiService.get('products');
      return (response as List<dynamic>)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //===================== Add New Product ===================//
  Future<ProductModel> AddNewProduct(ProductModel product) async {
    try {
      final response = await apiService.post('products', product.toJson());
      return ProductModel.fromJson(response);
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //===================== Get Single Product ===================//
  Future<ProductModel> getSingleProduct(String id) async {
    try {
      final response = await apiService.get('products/$id');
      return ProductModel.fromJson(response);
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //===================== Update Product ===================//
  Future<ProductModel> updateNewProduct(ProductModel product) async {
    try {
      final response = await apiService.put(
        'products/${product.id}',
        product.toJson(),
      );
      return ProductModel.fromJson(response);
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //===================== Delete Product ===================//
  Future<void> deleteProduct(String id) async {
    try {
      await apiService.delete('products/$id');
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
