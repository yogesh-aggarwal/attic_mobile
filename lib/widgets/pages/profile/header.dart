import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePageHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBottomBorder;

  const ProfilePageHeader({super.key, this.hasBottomBorder = false});

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: hasBottomBorder
            ? Border(
                bottom: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              )
            : null,
      ),
      child: [
        const Icon(LucideIcons.badgeHelp),
        "Profile".text.size(20).color(Colors.black).bold.make().p16(),
        const Icon(LucideIcons.settings2),
      ].hStack(alignment: MainAxisAlignment.spaceBetween),
    );
  }
}
