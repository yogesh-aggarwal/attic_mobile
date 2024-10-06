import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchPageBody extends StatelessWidget {
  final ScrollController scrollController;

  const SearchPageBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            36.heightBox,
          ],
        ).p16().scrollVertical(controller: scrollController),
      ],
    );
  }
}
