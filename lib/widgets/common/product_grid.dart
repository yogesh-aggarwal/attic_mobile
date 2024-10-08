import 'package:attic_mobile/types/product.dart';
import 'package:attic_mobile/widgets/common/product_card.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductGrid extends StatelessWidget {
  final int crossAxisCount;
  final double gridSpacing;
  final Axis scrollDirection;
  final List<Product> products;
  final bool highlightStock;

  const ProductGrid({
    super.key,
    required this.products,
    this.gridSpacing = 10.0,
    this.crossAxisCount = 2,
    this.scrollDirection = Axis.vertical,
    this.highlightStock = false,
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
            highlightStock: highlightStock,
          ).expand());
        } else {
          row.add(Container().expand());
        }

        row.add(gridSpacing.widthBox);
      }

      if (row.isNotEmpty) row.removeLast();

      children.add(row.hStack());
      children.add(gridSpacing.heightBox);
    }

    if (children.isNotEmpty) children.removeLast();

    return children.vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
