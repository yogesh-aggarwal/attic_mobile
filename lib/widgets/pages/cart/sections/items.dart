import 'package:attic_mobile/providers/products.dart';
import 'package:attic_mobile/types/product.dart';
import 'package:attic_mobile/widgets/pages/cart/common/section.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPageItemsSection extends StatelessWidget {
  const CartPageItemsSection({super.key});

  Widget _buildItem(BuildContext context, Product product) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleWidth = screenWidth - 200;

    return [
      [
        Image.network(
          product.media.images[0].url,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ).cornerRadius(12),
        10.widthBox,
        [
          product.listing.title.text
              .size(16)
              .color(Colors.black)
              .bold
              .ellipsis
              .make(),
          4.heightBox,
          "INR ${product.price.round()}.99".text.size(14).make(),
          4.heightBox,
        ]
            .vStack(crossAlignment: CrossAxisAlignment.start)
            .box
            .width(titleWidth)
            .make(),
      ].hStack().expand(),
      8.widthBox,
      [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(30),
          child: const Icon(Icons.remove, size: 16)
              .p(6)
              .box
              .roundedFull
              .color(Colors.grey.shade300.withOpacity(.4))
              .make(),
        ),
        12.widthBox,
        "1".text.size(14).make(),
        12.widthBox,
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(30),
          child: const Icon(Icons.add, size: 16)
              .p(6)
              .box
              .roundedFull
              .color(Colors.grey.shade300.withOpacity(.4))
              .make(),
        ),
      ].hStack(),
    ].hStack(alignment: MainAxisAlignment.spaceBetween);
  }

  @override
  Widget build(BuildContext context) {
    final products = context.read<ProductsProvider>().getRandProducts(5);

    return [
      CartPageSection(
        title: "Items",
        child: "5 items".text.make(),
      ),
      _buildItem(context, products[0]),
      for (final product in products.sublist(1)) ...[
        8.0.heightBox,
        _buildItem(context, product),
      ],
    ].vStack(crossAlignment: CrossAxisAlignment.start);
  }
}
