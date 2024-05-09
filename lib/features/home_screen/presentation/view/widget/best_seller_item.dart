import 'package:book_app/core/utils/app_routers.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/custom_book_rating.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/image_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.book,
  });
  final Book book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kBookView, extra: book),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            ImageBookItem(
              imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(book.volumeInfo!.title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle20.copyWith(
                          //  fontFamily: GoogleFonts.bitter().fontFamily,
                          )),
                    ),
                    Text(
                      book.volumeInfo!.authors![0],
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8), fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Free',
                          style: Styles.textStyle25,
                        ),
                        const Spacer(),
                        CustomBookRating(
                          count: book.volumeInfo?.pageCount ?? 0,
                          rating: book.volumeInfo!.maturityRating!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
