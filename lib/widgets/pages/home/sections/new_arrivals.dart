import 'package:attic_mobile/providers/products.dart';
import 'package:attic_mobile/widgets/common/product_grid.dart';
import 'package:attic_mobile/widgets/pages/home/common/section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageNewArrivalsSection extends StatelessWidget {
  const HomePageNewArrivalsSection({super.key});

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
      HomePageSection(title: "🚀 New Arrivals", child: _buildViewAllButton()),
      ProductGrid(
        crossAxisCount: 1,
        products: context.read<ProductsProvider>().getRandProducts(4),
      ),
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
