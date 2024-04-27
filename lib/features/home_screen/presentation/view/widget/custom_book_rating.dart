import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CustomBookRating extends StatelessWidget {
  const CustomBookRating({
    super.key,
    required this.rating,
    required this.count,
  });
  final String rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 18,
        ),
        const SizedBox(
          width: 6,
        ),
        const Text(
          "0",
          style: Styles.textStyle18,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "($count)",
          style: Styles.textStyle14,
        )
      ],
    );
  }
}
