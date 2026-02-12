import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Chip(
            label: Text(category),
            // ignore: deprecated_member_use
            backgroundColor: Appcolors.appColor.withOpacity(0.2),
          ),
          Spacer(),
          Row(
            children: List.generate(
              5,
              (index) => Icon(Icons.star, color: Colors.amber, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
