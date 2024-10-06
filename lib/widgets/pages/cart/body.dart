import 'package:attic_mobile/widgets/pages/home/sections/most_popular.dart';
import 'package:attic_mobile/widgets/pages/home/sections/popular_brands.dart';
import 'package:attic_mobile/widgets/pages/home/sections/spotlight.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPageBody extends StatelessWidget {
  final ScrollController scrollController;

  const CartPageBody({super.key, required this.scrollController});

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
      ],
    ).p16().scrollVertical(controller: scrollController);
  }
}
