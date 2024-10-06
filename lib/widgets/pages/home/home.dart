import 'package:attic_mobile/widgets/pages/home/body.dart';
import 'package:attic_mobile/widgets/pages/home/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: HomePageHeader(),
      body: HomePageBody(),
    );
  }
}
