import 'package:attic_mobile/widgets/pages/home/body.dart';
import 'package:attic_mobile/widgets/pages/home/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      const scrollThreshold = 15;

      if (_controller.position.pixels > scrollThreshold && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_controller.position.pixels < scrollThreshold && _isScrolled) {
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
      appBar: HomePageHeader(hasBottomBorder: _isScrolled),
      body: HomePageBody(scrollController: _controller),
    );
  }
}
