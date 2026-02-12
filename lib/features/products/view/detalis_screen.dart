// ignore_for_file: deprecated_member_use

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/features/products/data/productModel.dart';
import 'package:fake_api_app/features/products/view/updateProduct.dart';
import 'package:fake_api_app/features/widgets/category_row.dart';
import 'package:fake_api_app/features/widgets/description_card.dart';
import 'package:fake_api_app/features/widgets/single_product_data.dart';
import 'package:fake_api_app/features/products/view/home.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.to(() => Home()),
          icon: Icon(Icons.arrow_back, color: Appcolors.appColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () =>
                  Get.to(() => UpdateProduct(product: widget.product)),
              icon: Icon(Icons.edit, color: Appcolors.appColor),
            ),
          ),
        ],
        backgroundColor: Appcolors.appColor.withOpacity(0.1),
        elevation: 0,
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleProductData(product: widget.product),

            Gap(16),

            CategoryRow(category: widget.product.category),

            Gap(20),

            DescriptionCard(description: widget.product.description),

            Gap(30),
          ],
        ),
      ),
    );
  }
}
