import 'package:attic_mobile/types/product.dart';
import 'package:attic_mobile/widgets/common/product_card.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductHorizonatalCatalog extends StatelessWidget {
  final List<Product> products;

  const ProductHorizonatalCatalog({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: products
            .map(
              (product) => ProductCard(
                product: product,
                imageType: ProductCardImage.multi,
              ),
            )
            .toList(),
      ).p16(),
    );
  }
}
