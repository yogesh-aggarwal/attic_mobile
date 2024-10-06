import 'package:attic_mobile/widgets/pages/home/sections/popular_brands.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:velocity_x/velocity_x.dart';

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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomePagePopularBrandsSection(),
        // "Welcome to the homepage!".text.size(20).make(),
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
