import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:velocity_x/velocity_x.dart';

const height = 134.0;

class SearchPageHeader extends StatefulWidget implements PreferredSizeWidget {
  final bool hasBottomBorder;

  const SearchPageHeader({super.key, this.hasBottomBorder = false});

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  State<SearchPageHeader> createState() => _SearchPageHeaderState();
}

class _SearchPageHeaderState extends State<SearchPageHeader> {
  final TextEditingController _searchController = TextEditingController();
  List<String> activeFilters = [
    "Males",
    "Best Sellers",
  ];
  final List<String> allFilters = [
    "Males",
    "Females",
    "Kids",
    "Best Sellers",
    "New Arrivals",
    "Discounted",
  ];

  void _handleOnFilterTap(String filter) {
    setState(() {
      if (activeFilters.contains(filter)) {
        activeFilters.remove(filter);
      } else {
        activeFilters.add(filter);
      }
    });
  }

  void _handleSubmit(String value) {
    print(value);
  }

  void _handleOnScan() {
    print("Scanning...");
  }

  void _handleOnVoice() {
    print("Listening...");
  }

  Widget _buildSearchBar() {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(30),
        ),
        child: [
          [
            const Icon(LucideIcons.search, color: Colors.grey),
            12.widthBox,
            TextField(
              autofocus: true,
              controller: _searchController,
              onSubmitted: _handleSubmit,
              decoration: const InputDecoration(
                hintText: 'Search for products',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ).expand(),
          ].hStack().expand(),
          [
            const Icon(LucideIcons.scanLine, color: Colors.grey)
                .onTap(_handleOnScan),
            16.widthBox,
            const Icon(LucideIcons.mic, color: Colors.grey)
                .onTap(_handleOnVoice),
          ].hStack(),
        ].hStack(),
      ),
    );
  }

  Widget _buildFilters() {
    final widgets = allFilters.map((filter) {
      final isActive = activeFilters.contains(filter);

      return InkWell(
        onTap: () => _handleOnFilterTap(filter),
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.white,
            border: Border.all(
              color: isActive ? Colors.black : Colors.grey[300]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: filter.text
              .size(16)
              .color(isActive ? Colors.white : Colors.black)
              .make(),
        ),
      );
    }).toList();

    return [
      widgets[0],
      for (var widget in widgets.sublist(1)) ...[
        6.widthBox,
        widget,
      ],
    ].hStack().scrollHorizontal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: [
        8.heightBox,
        _buildSearchBar(),
        12.heightBox,
        _buildFilters(),
      ].vStack(crossAlignment: CrossAxisAlignment.start),
    );
  }
}
