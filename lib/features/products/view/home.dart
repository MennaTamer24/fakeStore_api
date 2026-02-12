// ignore_for_file: deprecated_member_use

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/product_controller.dart';
import 'package:fake_api_app/shared/widgets/cutom_BottomNavigationBar.dart';
import 'package:fake_api_app/shared/widgets/cutom_drawer.dart';
import 'package:fake_api_app/shared/widgets/main_appBar.dart';
import 'package:fake_api_app/features/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CutomDrawer(),
      backgroundColor: Appcolors.backgroundColor,
      appBar: const MainAppBar(),
      body: Obx(
        () => SingleChildScrollView(
          child: productController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : productController.productList.isEmpty
              ? const Center(child: Text('No Products Found'))
              : ProductGrid(),
        ),
      ),
      bottomNavigationBar: CutomBottomnavigationbar(
        totalCost: productController.totalCost,
        productCounter: productController.productCounter,
      ),
    );
  }
}
