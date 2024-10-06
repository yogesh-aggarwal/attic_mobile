import 'package:attic_mobile/types/product.dart';
import 'package:attic_mobile/widgets/common/product_grid.dart';
import 'package:attic_mobile/widgets/pages/home/common/section.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageGenericSection extends StatelessWidget {
  final String title;
  final List<Product> products;
  final int visibleProductCount;
  final Function() onTap;
  final Axis scrollDirection;

  const HomePageGenericSection({
    super.key,
    required this.title,
    required this.products,
    required this.onTap,
    this.visibleProductCount = 4,
    this.scrollDirection = Axis.vertical,
  });

  Widget _buildViewAllButton() {
    return [
      "View All".text.size(12).semiBold.gray600.make(),
      2.widthBox,
      "(20)".text.size(12).gray400.make(),
    ].row().onTap(onTap);
  }

  @override
  Widget build(BuildContext context) {
    return [
      HomePageSection(title: title, child: _buildViewAllButton()),
      ProductGrid(
        crossAxisCount: 2,
        scrollDirection: scrollDirection,
        products: products.take(visibleProductCount).toList(),
      ),
    ].hStack(crossAlignment: CrossAxisAlignment.start);
  }
}
