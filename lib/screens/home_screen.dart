import 'package:flutter/material.dart';

import '../constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(AppStrings.loadingText),
        ),
      ),
    );
  }
}
