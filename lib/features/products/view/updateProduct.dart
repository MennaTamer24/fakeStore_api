// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/core/controllers/product_controller.dart';
import 'package:fake_api_app/features/products/data/productModel.dart';
import 'package:fake_api_app/features/widgets/data_card.dart';
import 'package:fake_api_app/features/widgets/image_view.dart';
import 'package:fake_api_app/features/widgets/update_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key, required this.product});

  final ProductModel product;

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();
  final imageController = TextEditingController();
  final descController = TextEditingController();

  final ProductController controller = Get.find<ProductController>();

  @override
  void initState() {
    super.initState();

    titleController.text = widget.product.title;
    priceController.text = widget.product.price.toString();
    categoryController.text = widget.product.category;
    imageController.text = widget.product.image;
    descController.text = widget.product.description;

    controller.imageUrl.value = widget.product.image;

    imageController.addListener(() {
      controller.imageUrl.value = imageController.text.trim();
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    categoryController.dispose();
    imageController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        title: const Text("Update Product"),
        backgroundColor: Appcolors.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ImageView(),

              const SizedBox(height: 20),

              DataCard(
                titleController: titleController,
                priceController: priceController,
                categoryController: categoryController,
                imageController: imageController,
                descController: descController,
              ),

              const SizedBox(height: 30),

              /// Update Button
              UpdateBtn(
                id: widget.product.id,
                titleController: titleController,
                priceController: priceController,
                categoryController: categoryController,
                imageController: imageController,
                descController: descController,
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
