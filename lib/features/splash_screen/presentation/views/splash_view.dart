import 'package:book_app/core/utils/app_routers.dart';
import 'package:book_app/features/splash_screen/presentation/views/widget/splash_view_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewDetails(),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      // Get.offAll(
      //   () => const HomeView(),
      //   transition: Transition.fadeIn,
      //   duration: const Duration(milliseconds: 250),
      // );
      GoRouter.of(context).go(AppRouter.kHomeView);
    });
  }
}
