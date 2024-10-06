import 'dart:math';

import 'package:attic_mobile/types/product.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

enum ProductCardImage { small, big, multi }

class ProductCard extends StatelessWidget {
  final Product product;
  final ProductCardImage imageType;
  final bool highlightStock;

  const ProductCard({
    super.key,
    required this.product,
    this.imageType = ProductCardImage.small,
    this.highlightStock = false,
  });

  Widget _buildSmallImage() {
    return Image.network(
      product.images[0],
      fit: BoxFit.cover,
      height: 120,
      width: double.infinity,
    ).cornerRadius(10);
  }

  Widget _buildBigImage() {
    return Image.network(
      product.images[0],
      fit: BoxFit.cover,
      height: 200,
      width: double.infinity,
    ).cornerRadius(10);
  }

  Widget _buildMultiImage() {
    const maxImages = 3;

    List<Widget> widgets = [];
    for (int i = 0; i < min(maxImages, product.images.length); i++) {
      widgets.add(
        Image.network(
          product.images[i],
          fit: BoxFit.cover,
          height: 120,
        ).cornerRadius(10).expand(),
      );
      widgets.add(4.widthBox);
    }
    widgets.removeLast();

    return widgets.hStack();
  }

  Widget _buildImage() {
    switch (imageType) {
      case ProductCardImage.big:
        return _buildBigImage();
      case ProductCardImage.small:
        return _buildSmallImage();
      case ProductCardImage.multi:
        return _buildMultiImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.0, color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 15.0,
            ),
          ],
        ),
        child: [
          // Image
          _buildImage().p4(),
          8.heightBox,
          // Row 1
          [
            // Title
            product.title.text.size(15).semiBold.ellipsis.make().flexible(),
            8.widthBox,
          ].hStack().px12(),
          2.heightBox,
          // Row 2
          [
            // Brand name
            [
              "Adidas".text.size(14).gray400.make(),
              4.widthBox,
              Icon(Icons.check_circle, size: 16, color: Colors.blue.shade800),
            ].hStack(),
            // Star rating
            [
              Icon(Icons.star, size: 16, color: Colors.yellow.shade800),
              3.widthBox,
              product.stats.rating.toString().text.size(14).semiBold.make(),
            ].hStack(),
          ].hStack(alignment: MainAxisAlignment.spaceBetween).px12(),
          8.heightBox,
          // Row 3
          [
            // Price
            "INR ${product.costing.sellingPrice.round()}.99"
                .toString()
                .text
                .ellipsis
                .size(14)
                .semiBold
                .make()
                .expand(),
            12.widthBox,
            // Discount
            (highlightStock
                    ? "Only ${product.details.stock} left"
                    : "${product.details.stock} in stock")
                .text
                .size(12)
                .ellipsis
                .color(highlightStock ? Colors.red : Colors.grey.shade600)
                .fontWeight(
                    highlightStock ? FontWeight.bold : FontWeight.normal)
                .make(),
          ].hStack(alignment: MainAxisAlignment.spaceBetween).px12(),
          14.heightBox,
        ].vStack(crossAlignment: CrossAxisAlignment.start),
      ),
    );
  }
}
