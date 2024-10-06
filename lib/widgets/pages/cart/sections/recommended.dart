import 'package:attic_mobile/widgets/common/product_grid.dart';
import 'package:attic_mobile/widgets/pages/cart/common/section.dart';
import 'package:attic_mobile/widgets/pages/lib/misc.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPageRecommendedSection extends StatelessWidget {
  const CartPageRecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      const CartPageSection(title: "Similar Items"),
      ProductGrid(products: [product, product]),
      8.0.heightBox,
      ProductGrid(products: [product], crossAxisCount: 1),
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
