import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

@immutable
class CartPageSection extends StatelessWidget {
  final String title;
  final Widget? child;

  const CartPageSection({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return [
      title.text.size(18).semiBold.make(),
      16.heightBox,
      child ?? Container(),
    ].hStack(alignment: MainAxisAlignment.spaceBetween).pOnly(bottom: 16);
  }
}
