import 'package:attic_mobile/widgets/pages/home/common/section.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePagePopularBrandsSection extends StatelessWidget {
  const HomePagePopularBrandsSection({super.key});

  Widget _buildBrandIcon({
    required BuildContext context,
    required String title,
    required IconData icon,
    Function()? onTap,
  }) {
    return [
      InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Icon(icon, size: 22)
            .p16()
            .box
            .roundedLg
            .color(Theme.of(context).primaryColor.withOpacity(0.1))
            .make(),
      ),
      6.heightBox,
      title.text.size(8).medium.make(),
    ].vStack().onTap(onTap);
  }

  @override
  Widget build(BuildContext context) {
    final spacing = 16.0.widthBox;

    return [
      const HomePageSection(title: "Popular Brands"),
      [
        _buildBrandIcon(
          context: context,
          title: "Apple",
          icon: LucideIcons.apple,
        ),
        spacing,
        _buildBrandIcon(
          context: context,
          title: "GitHub",
          icon: LucideIcons.github,
        ),
        spacing,
        _buildBrandIcon(
          context: context,
          title: "Facebook",
          icon: LucideIcons.facebook,
        ),
        spacing,
        _buildBrandIcon(
          context: context,
          title: "Chrome",
          icon: LucideIcons.chrome,
        ),
        spacing,
        _buildBrandIcon(
          context: context,
          title: "Twitter",
          icon: LucideIcons.twitter,
        ),
        spacing,
        _buildBrandIcon(
          context: context,
          title: "Instagram",
          icon: LucideIcons.instagram,
        ),
      ].hStack().scrollHorizontal(),
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
