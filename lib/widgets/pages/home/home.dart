import 'package:attic_mobile/widgets/pages/home/sections/most_popular.dart';
import 'package:attic_mobile/widgets/pages/home/sections/spotlight.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:attic_mobile/widgets/pages/home/sections/popular_brands.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: [
            const Icon(LucideIcons.menu),
            "Hi there!".text.size(20).color(Colors.black).bold.make().p16(),
            const Icon(LucideIcons.bell),
          ].hStack(
            alignment: MainAxisAlignment.spaceBetween,
            crossAlignment: CrossAxisAlignment.center,
          )),
    );
  }

  Widget _buildBody() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
