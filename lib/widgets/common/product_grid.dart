import 'package:attic_mobile/types/product.dart';
import 'package:attic_mobile/widgets/common/product_card.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductGrid extends StatelessWidget {
  final int crossAxisCount;
  final double gridSpacing;
  final List<Product> products;

  const ProductGrid({
    super.key,
    required this.products,
    this.gridSpacing = 8.0,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < products.length; i += crossAxisCount) {
      List<Widget> row = [];

      for (int j = 0; j < crossAxisCount; j++) {
        if (i + j < products.length) {
          row.add(ProductCard(
            product: products[i + j],
            imageType: crossAxisCount == 1
                ? ProductCardImage.multi
                : ProductCardImage.small,
          ).expand());
        } else {
          row.add(Container().expand());
        }

        row.add(gridSpacing.widthBox);
      }

      row.removeLast();

      children.add(row.hStack());
      children.add(gridSpacing.heightBox);
    }

    children.removeLast();

    return children.vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
