import 'package:attic_mobile/widgets/pages/wishlist/body.dart';
import 'package:attic_mobile/widgets/pages/wishlist/header.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final ScrollController _controller = ScrollController();

  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels > 0 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_controller.position.pixels == 0 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WishlistPageHeader(hasBottomBorder: _isScrolled),
      body: WishlistPageBody(scrollController: _controller),
    );
  }
}
