import 'package:book_app/features/home_screen/presentation/view/widget/home_view_details.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeViewDetails()),
    );
  }
}
