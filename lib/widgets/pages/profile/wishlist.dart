import 'package:attic_mobile/widgets/pages/profile/body.dart';
import 'package:attic_mobile/widgets/pages/profile/header.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      appBar: ProfilePageHeader(hasBottomBorder: _isScrolled),
      body: ProfilePageBody(scrollController: _controller),
    );
  }
}
