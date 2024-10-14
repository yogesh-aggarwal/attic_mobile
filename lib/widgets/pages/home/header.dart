import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBottomBorder;

  const HomePageHeader({super.key, this.hasBottomBorder = false});

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
        const Icon(LucideIcons.menu),
        l10n.title.text.size(20).color(Colors.black).bold.make().p16(),
        const Icon(LucideIcons.bell),
      ].hStack(alignment: MainAxisAlignment.spaceBetween),
    );
  }
}
