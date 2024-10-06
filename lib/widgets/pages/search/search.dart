import 'package:attic_mobile/widgets/pages/search/body.dart';
import 'package:attic_mobile/widgets/pages/search/header.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      appBar: SearchPageHeader(hasBottomBorder: _isScrolled),
      body: SearchPageBody(scrollController: _controller),
    );
  }
}
