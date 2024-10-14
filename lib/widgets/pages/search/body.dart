import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pair/pair.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchPageBody extends StatefulWidget {
  final ScrollController scrollController;

  const SearchPageBody({super.key, required this.scrollController});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  String _selectedCategory = "Electronics";

  final List<Pair<String, IconData>> _categories = [
    const Pair("Electronics", LucideIcons.monitor),
    const Pair("Clothing", LucideIcons.shirt),
    const Pair("Shoes", LucideIcons.footprints),
    const Pair("Books", LucideIcons.book),
    const Pair("Furniture", LucideIcons.home),
    const Pair("Appliances", LucideIcons.plug),
    const Pair("Toys", LucideIcons.truck),
    const Pair("Sports", LucideIcons.beef),
    const Pair("Automotive", LucideIcons.car),
    const Pair("Beauty", LucideIcons.lollipop),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> categoriesWidgets = [];
    for (final category in _categories) {
      final isSelected = category.key == _selectedCategory;

      categoriesWidgets.add(
        InkWell(
          onTap: () {
            setState(() {
              _selectedCategory = category.key;
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
              width: context.screenWidth * 0.3,
              constraints: const BoxConstraints(minWidth: 120),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: isSelected
                    ? context.theme.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: [
                Icon(category.value,
                    color: isSelected ? Colors.white : Colors.black),
                6.heightBox,
                category.key.text.ellipsis
                    .size(14)
                    .color(isSelected ? Colors.white : Colors.black)
                    .bold
                    .make(),
              ].vStack().py20()),
        ),
      );
      categoriesWidgets.add(8.widthBox);
    }
    if (categoriesWidgets.isNotEmpty) categoriesWidgets.removeLast();

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [
            //   "Search Results".text.size(20).bold.make(),
            //   2.heightBox,
            //   "Showing 1-10 of 100 results".text.make(),
            // ].vStack(
            //     alignment: MainAxisAlignment.spaceBetween,
            //     crossAlignment: CrossAxisAlignment.start),
            categoriesWidgets.hStack().scrollHorizontal(),
          ],
        ).p16().scrollVertical(controller: widget.scrollController),
      ],
    );
  }
}
