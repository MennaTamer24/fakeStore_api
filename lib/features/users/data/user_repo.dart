import 'package:dio/dio.dart';
import 'package:fake_api_app/core/errors/api_error.dart';
import 'package:fake_api_app/core/errors/api_exceptions.dart';
import 'package:fake_api_app/core/network/api_services.dart';
import 'package:fake_api_app/features/users/data/userModel.dart';

class UserRepo {
  final ApiService apiService = ApiService();

  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await apiService.get('users');
      return (response as List<dynamic>)
          .map((e) => UserModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<UserModel> getSingleUser(int id) async {
    try {
      final response = await apiService.get('users/$id');
      return UserModel.fromJson(response);
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<UserModel> addNewUser(UserModel user) async {
    try {
      final response = await apiService.post('users', user.toJson());
      return UserModel.fromJson(response);
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<UserModel> updateUser(UserModel user) async {
    try {
      final response = await apiService.put('users/${user.id}', user.toJson());

      return UserModel.fromJson(response);
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  Future<void> deleteUser(UserModel user) async {
    try {
      await apiService.delete('users/${user.id}');
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
