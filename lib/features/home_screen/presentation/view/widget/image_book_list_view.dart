import 'package:book_app/core/utils/widgets/custom_error_widget.dart';
import 'package:book_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home_screen/presentation/manage/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/image_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageBookListView extends StatelessWidget {
  ImageBookListView({
    super.key,
  });
  final ScrollController? scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          if (state.bookList.isNotEmpty) {
            autoScrollToEnd();
          }
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksFailure) {
          return SliverToBoxAdapter(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * .17,
                  child: CustomErrorWidget(errorMessage: state.errorMessage)));
        } else if (state is SimilarBooksSuccess) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .17,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
              controller: scrollController,
                  itemCount: state.bookList.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ImageBookItem(
                      imageUrl: state
                          .bookList[index].volumeInfo!.imageLinks!.thumbnail!,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * .17,
                child: const CustomLoadingIndicator()),
          );
        }
      },
    );
  }

  Future<void> autoScrollToEnd() async {
    await Future.delayed(const Duration(seconds: 1), () {
      scrollController!.animateTo(
        scrollController!.position.maxScrollExtent,
        duration: const Duration(seconds: 25),
        curve: Curves.easeInOut,
      );
    });
  }
}
