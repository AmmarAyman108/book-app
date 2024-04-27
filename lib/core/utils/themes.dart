import 'package:book_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static getTheme() {
    return ThemeData.dark().copyWith(
      
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(Colors.white),
              iconSize: MaterialStatePropertyAll(30))),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColor.kPrimaryColor,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: AppColor.kPrimaryColor,
              systemNavigationBarDividerColor: AppColor.kPrimaryColor),
          backgroundColor: AppColor.kPrimaryColor,
          elevation: 0),
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Bitter',
          ),
      scaffoldBackgroundColor: AppColor.kPrimaryColor,
    );
  }
}
