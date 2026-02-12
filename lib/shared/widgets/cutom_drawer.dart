import 'package:fake_api_app/features/cartHistory/view/cart_historyView.dart';
import 'package:fake_api_app/features/users/view/usersView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fake_api_app/core/utils/shared_preferences.dart';
import 'package:fake_api_app/features/auth/view/log_in.dart';

class CutomDrawer extends StatelessWidget {
  const CutomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Menu', style: TextStyle(fontSize: 20)),
          ),

          /// 🛒 Cart History
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart History'),
            onTap: () {
              Get.to(() => const CartView());
            },
          ),

          /// 👤 Users
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Users'),
            onTap: () {
              Get.to(() => const UsersView());
            },
          ),

          const Divider(),

          /// 🚪 Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () async {
              await SharedPreference.clearToken();

              Get.offAll(() => Login());
            },
          ),
        ],
      ),
    );
  }
}
