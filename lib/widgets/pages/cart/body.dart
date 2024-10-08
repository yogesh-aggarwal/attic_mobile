import 'package:attic_mobile/widgets/pages/cart/footer.dart';
import 'package:attic_mobile/widgets/pages/cart/sections/items.dart';
import 'package:attic_mobile/widgets/pages/cart/sections/recommended.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPageBody extends StatelessWidget {
  final ScrollController scrollController;

  const CartPageBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CartPageItemsSection(),
            // 36.heightBox,
            // const CartPageSpotlightSection(),
            36.heightBox,
            const CartPageRecommendedSection(),
            80.heightBox,
          ],
        ).p16().scrollVertical(controller: scrollController),
        const CartPageFooter(),
      ],
    );
  }
}
