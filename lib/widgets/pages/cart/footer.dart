import 'package:attic_mobile/core/intl/utils.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPageFooter extends StatefulWidget {
  const CartPageFooter({super.key});

  @override
  _CartPageFooterState createState() => _CartPageFooterState();
}

class _CartPageFooterState extends State<CartPageFooter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Slide up from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SlideTransition(
            position: _offsetAnimation,
            child: Container(
              width: context.screenWidth,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
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
                    numberToCurrency("hi_IN", 139999 * 5)
                        .text
                        .white
                        .medium
                        .size(16)
                        .make(),
                    [
                      "Checkout".text.white.size(16).make(),
                      8.widthBox,
                      const Icon(LucideIcons.moveRight,
                          color: Colors.white, size: 20),
                    ].hStack().shimmer(
                        count: 2,
                        primaryColor: Colors.white,
                        secondaryColor: Colors.black),
                  ].hStack(alignment: MainAxisAlignment.spaceBetween),
                ).box.roundedFull.make(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
