import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class WishlistPageHeader extends StatelessWidget
    implements PreferredSizeWidget {
  final bool hasBottomBorder;

  const WishlistPageHeader({super.key, this.hasBottomBorder = false});

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
        Container(),
        "Wishlist".text.size(20).color(Colors.black).bold.make().p16(),
        Container(),
      ].hStack(alignment: MainAxisAlignment.spaceBetween),
    );
  }
}
