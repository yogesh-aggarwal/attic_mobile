import 'package:attic_mobile/widgets/pages/home/sections/generic.dart';
import 'package:attic_mobile/widgets/pages/home/sections/most_popular.dart';
import 'package:attic_mobile/widgets/pages/home/sections/new_arrivals.dart';
import 'package:attic_mobile/widgets/pages/home/sections/popular_brands.dart';
import 'package:attic_mobile/widgets/pages/home/sections/spotlight.dart';
import 'package:attic_mobile/core/misc.dart';
import 'package:flutter/material.dart';
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
        // HomePageGenericSection(
        //   title: "40% Off",
        //   products: [product, product, product, product],
        //   onTap: () => print("Tapped on 40% Off"),
        // ),
        36.heightBox,
        const HomePageSpotlightSection(),
      ],
    ).p16().scrollVertical(controller: scrollController);
  }
}
