import 'package:fake_api_app/features/cartHistory/cart_model.dart';
import 'package:fake_api_app/features/cartHistory/widget/updateCartElevatedBtn.dart';
import 'package:fake_api_app/shared/widgets/custom_txtfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdateCartView extends StatefulWidget {
  final CartModel cart;

  const UpdateCartView({super.key, required this.cart});

  @override
  State<UpdateCartView> createState() => _UpdateCartViewState();
}

class _UpdateCartViewState extends State<UpdateCartView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController userIdController;

  @override
  void initState() {
    super.initState();
    userIdController = TextEditingController(
      text: widget.cart.userId.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Edit Cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(20),

                    CustomTxtfield(
                      hint: 'User ID',
                      isPassword: false,
                      controller: userIdController,
                    ),

                    Gap(30),
                    Updatecartelevatedbtn(
                      formKey: _formKey,
                      id: widget.cart.id,
                      userIdController: userIdController,
                      products: widget.cart.products,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
