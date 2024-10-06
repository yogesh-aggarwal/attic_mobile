import 'package:attic_mobile/widgets/pages/cart/common/section.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPageItemsSection extends StatelessWidget {
  const CartPageItemsSection({super.key});

  Widget _buildItem(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return [
      const CartPageSection(title: "Items"),
      [
        _buildItem(context),
        _buildItem(context),
        _buildItem(context),
        _buildItem(context),
        _buildItem(context),
      ].hStack().scrollHorizontal(),
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
