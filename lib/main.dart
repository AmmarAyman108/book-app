import 'package:book_app/core/utils/app_routers.dart';
import 'package:book_app/core/utils/colors.dart';
import 'package:book_app/core/utils/themes.dart';
import 'package:book_app/features/home_screen/presentation/manage/featured_cubit/featured_book_cubit.dart';
import 'package:book_app/features/home_screen/presentation/manage/news_books_cubit/news_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  getUiOverStyle();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBookCubit()..fetchFeaturedBook(),
        ),
        BlocProvider(
          create: (context) => NewsBooksCubit()..fetchNewsBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: AppTheme.getTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

void getUiOverStyle() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.kPrimaryColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColor.kPrimaryColor,
      systemNavigationBarDividerColor: AppColor.kPrimaryColor));
}
