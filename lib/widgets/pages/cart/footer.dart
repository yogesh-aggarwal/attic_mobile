import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPageFooter extends StatelessWidget {
  const CartPageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: context.screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: [
              "INR 999.99".text.white.medium.size(16).make(),
              [
                "Checkout".text.white.size(16).make(),
                8.widthBox,
                const Icon(LucideIcons.moveRight,
                    color: Colors.white, size: 20),
              ].hStack().shimmer(
                  count: 1,
                  primaryColor: Colors.white,
                  secondaryColor: Colors.black),
            ].hStack(alignment: MainAxisAlignment.spaceBetween),
          ).box.roundedFull.make(),
        ),
      ),
    );
  }
}
