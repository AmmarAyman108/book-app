
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomHomeDetailsAppBar extends StatelessWidget {
  const CustomHomeDetailsAppBar({
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
            Icons.close,
          ),
        ),
        const Spacer(),
        IconButton(
          padding: const EdgeInsets.only(right: 5),
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
      ],
    );
  }
}
