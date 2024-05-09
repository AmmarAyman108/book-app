import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:book_app/features/home_screen/presentation/manage/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/book_action_button.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/custom_book_rating.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/custom_home_details_app_bar.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/image_book_item.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/image_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final Book book;

  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: widget.book.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const SliverToBoxAdapter(child: CustomHomeDetailsAppBar()),
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4,
                    vertical: 40,
                  ),
                  child: ImageBookItem(
                    imageUrl: widget.book.volumeInfo!.imageLinks!.thumbnail!,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  widget.book.volumeInfo!.title!,
                  style: Styles.textStyle25,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 6,
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  widget.book.volumeInfo!.authors![0],
                  textAlign: TextAlign.center,
                  style: Styles.textStyle20.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(.6),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverToBoxAdapter(
                child: CustomBookRating(
              count: widget.book.volumeInfo!.pageCount!,
              rating: '',
            )),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            const SliverToBoxAdapter(child: BookActionButton()),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            const SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'You can also like ',
                  style: Styles.textStyle20,
                ),
              ),
            ),
            ImageBookListView(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
