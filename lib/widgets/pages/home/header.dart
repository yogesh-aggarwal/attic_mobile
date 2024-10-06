import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomePageHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: [
        const Icon(LucideIcons.menu),
        "Hi there!".text.size(20).color(Colors.black).bold.make().p16(),
        const Icon(LucideIcons.bell),
      ].hStack(
        alignment: MainAxisAlignment.spaceBetween,
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
