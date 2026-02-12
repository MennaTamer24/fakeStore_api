import 'package:fake_api_app/core/constants/appColors.dart';
import 'package:fake_api_app/features/products/view/add_product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CutomBottomnavigationbar extends StatelessWidget {
  const CutomBottomnavigationbar({
    super.key,
    required this.totalCost,
    required this.productCounter,
  });

  final RxDouble totalCost;
  final RxInt productCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Appcolors.appColor.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Obx(
        () => Row(
          children: [
            const Gap(20),

            /// 👇 STACK رجع زي ما هو
            Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                ),

                /// 👇 الدايرة (Badge)
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Appcolors.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      productCounter.value.toString(),
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            const Gap(12),

            Text(
              "Total cost: \$ ${totalCost.value}",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Spacer(),
            IconButton(
              onPressed: () => Get.to(() => AddProduct()),
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
