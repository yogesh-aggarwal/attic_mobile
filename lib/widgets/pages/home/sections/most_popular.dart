import 'package:attic_mobile/widgets/common/product_grid.dart';
import 'package:attic_mobile/widgets/pages/home/common/section.dart';
import 'package:attic_mobile/core/misc.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageMostPopularSection extends StatelessWidget {
  const HomePageMostPopularSection({super.key});

  Widget _buildViewAllButton() {
    return [
      "View All".text.size(12).semiBold.gray600.make(),
      2.widthBox,
      "(20)".text.size(12).gray400.make(),
    ].row().onTap(() {
      print("Tapped on View All");
    });
  }

  @override
  Widget build(BuildContext context) {
    return [
      HomePageSection(title: "Most Popular", child: _buildViewAllButton()),
      ProductGrid(
        crossAxisCount: 2,
        products: [product, product, product, product],
      ),
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
