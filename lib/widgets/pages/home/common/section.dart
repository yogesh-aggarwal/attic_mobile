import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

@immutable
class HomePageSection extends StatelessWidget {
  final String title;
  final Widget? child;

  const HomePageSection({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return [
      title.text.ellipsis.size(20).semiBold.make().expand(),
      16.heightBox,
      child ?? Container(),
    ].hStack(alignment: MainAxisAlignment.spaceBetween).pOnly(bottom: 16);
  }
}
