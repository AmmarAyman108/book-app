
import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSearchViewAppBar extends StatelessWidget {
  const CustomSearchViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            padding: const EdgeInsets.only(left: 5),
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
            )),
        const Text(
          'Search',
          style: Styles.textStyle25,
        )
      ],
    );
  }
}
