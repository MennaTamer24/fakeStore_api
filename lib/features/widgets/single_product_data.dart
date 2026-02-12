// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingleProductData extends StatelessWidget {
  const SingleProductData({super.key, this.product});
  final product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(10),
        Container(
          width: double.infinity,
          height: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
          ),
          child: Image.network(product.image, fit: BoxFit.contain),
        ),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: Card(
              color: Appcolors.appColor.withOpacity(0.1),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(10),
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Appcolors.appColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
