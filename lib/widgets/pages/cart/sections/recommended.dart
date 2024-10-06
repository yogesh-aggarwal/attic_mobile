import 'package:attic_mobile/providers/products.dart';
import 'package:attic_mobile/widgets/common/product_grid.dart';
import 'package:attic_mobile/widgets/pages/cart/common/section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPageRecommendedSection extends StatelessWidget {
  const CartPageRecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.read<ProductsProvider>().getRandProducts(3);

    return [
      const CartPageSection(title: "Similar Items"),
      ProductGrid(products: products.take(2).toList(), crossAxisCount: 2),
      10.0.heightBox,
      ProductGrid(products: [products[2]], crossAxisCount: 1),
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
