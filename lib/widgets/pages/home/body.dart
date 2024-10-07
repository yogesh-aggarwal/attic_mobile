import 'package:attic_mobile/providers/products.dart';
import 'package:attic_mobile/widgets/pages/home/sections/generic.dart';
import 'package:attic_mobile/widgets/pages/home/sections/most_popular.dart';
import 'package:attic_mobile/widgets/pages/home/sections/new_arrivals.dart';
import 'package:attic_mobile/widgets/pages/home/sections/popular_brands.dart';
import 'package:attic_mobile/widgets/pages/home/sections/spotlight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageBody extends StatelessWidget {
  final ScrollController scrollController;

  const HomePageBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomePageSpotlightSection(),
        36.heightBox,
        const HomePagePopularBrandsSection(),
        36.heightBox,
        const HomePageMostPopularSection(),
        36.heightBox,
        const HomePageNewArrivalsSection(),
        36.heightBox,
        HomePageGenericSection(
          title: "🚨 Almost Sold Out",
          products: context.read<ProductsProvider>().getRandProducts(4),
          highlightStock: true,
          onTap: () => print("Tapped on 40% Off"),
        ),
        36.heightBox,
        HomePageGenericSection(
          title: "💸 40% Off",
          products: context.read<ProductsProvider>().getRandProducts(4),
          onTap: () => print("Tapped on 40% Off"),
        ),
        36.heightBox,
        HomePageGenericSection(
          title: "🤌 Hand Picked For You",
          products: context.read<ProductsProvider>().getRandProducts(4),
          onTap: () => print("Tapped on Hand Picked For You"),
        ),
        36.heightBox,
        HomePageGenericSection(
          title: "🎁 Top Gifting Choices",
          visibleProductCount: 6,
          products: context.read<ProductsProvider>().getRandProducts(6),
          onTap: () => print("Tapped on Hand Picked For You"),
        ),
        36.heightBox,
        HomePageGenericSection(
          title: "🥰 Wall of Love",
          visibleProductCount: 8,
          products: context.read<ProductsProvider>().getRandProducts(8),
          onTap: () => print("Tapped on Hand Picked For You"),
        ),
      ],
    ).p16().scrollVertical(controller: scrollController);
  }
}
