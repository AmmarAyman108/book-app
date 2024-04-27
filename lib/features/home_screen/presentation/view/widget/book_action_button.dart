import 'package:book_app/core/utils/style.dart';
import 'package:book_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookActionButton extends StatelessWidget {
  const BookActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(50)),
              color: Colors.white,
              text: r'19.99$',
              textStyle: Styles.textStyle20.copyWith(
                color: Colors.black,
              ),
              onPressed: () {}),
        ),
        Expanded(
          child: CustomButton(
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(50)),
              color: const Color.fromARGB(255, 254, 41, 25),
              text: 'Free Review',
              textStyle: Styles.textStyle18,
              onPressed: () {}),
        ),
      ],
    );
  }
}
