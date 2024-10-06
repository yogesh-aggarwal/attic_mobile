import 'package:attic_mobile/widgets/pages/home/sections/most_popular.dart';
import 'package:attic_mobile/widgets/pages/home/sections/popular_brands.dart';
import 'package:attic_mobile/widgets/pages/home/sections/spotlight.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomePageSpotlightSection(),
        32.heightBox,
        const HomePagePopularBrandsSection(),
        32.heightBox,
        const HomePageMostPopularSection(),
      ],
    ).p16().scrollVertical();
  }
}
