import 'package:attic_mobile/widgets/pages/cart/common/section.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPageSpotlightSection extends StatelessWidget {
  const CartPageSpotlightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      const CartPageSection(title: "Featured"),
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
