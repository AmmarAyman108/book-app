import 'package:book_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewDetails extends StatelessWidget {
  const SplashViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Images.logo),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Read Free Books',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        )
      ],
    );
  }
}
