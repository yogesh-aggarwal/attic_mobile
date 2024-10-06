import 'package:attic_mobile/widgets/pages/cart/body.dart';
import 'package:attic_mobile/widgets/pages/cart/header.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      appBar: CartPageHeader(hasBottomBorder: _isScrolled),
      body: CartPageBody(scrollController: _controller),
    );
  }
}
