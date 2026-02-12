import 'package:fake_api_app/core/network/api_services.dart';
import 'package:fake_api_app/core/utils/shared_preferences.dart';

class AuthRepo {
  final ApiService apiService = ApiService();

  Future<bool> logIn(String username, String password) async {
    try {
      final response = await apiService.post("auth/login", {
        "username": username,
        "password": password,
      });

      final token = response['token'];

      if (token != null) {
        await SharedPreference.saveToken(token);
        return true;
      }

      return false;
    } catch (e) {
      print("Login failed: $e");
      return false;
    }
  }
}
