// // ignore_for_file: avoid_print

import 'package:fake_api_app/core/network/api_services.dart';
import 'package:fake_api_app/core/utils/shared_preferences.dart';

class AuthRepo {
  final ApiService apiService = ApiService();

  Future<bool> logIn(String username, String password) async {
    try {
      // POST request
      final response = await apiService.post("auth/login", {
        "username": username,
        "password": password,
      });

      // ناخد الـ token
      final token = response['token'];

      // نحفظه في SharedPreferences
      if (token != null) {
        await SharedPreference.saveToken(token);
        return true; // login ناجح
      }

      return false; // login فشل
    } catch (e) {
      // هنا أي خطأ هييجي من Dio أو Network
      print("Login failed: $e");
      return false;
    }
  }
}
