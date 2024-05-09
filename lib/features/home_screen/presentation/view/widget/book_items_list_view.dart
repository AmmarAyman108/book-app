import 'package:book_app/core/utils/widgets/custom_error_widget.dart';
import 'package:book_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home_screen/presentation/manage/featured_cubit/featured_book_cubit.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/image_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookItemListView extends StatelessWidget {
  FeaturedBookItemListView({
    super.key,
  });

  final ScrollController? scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookSuccess) {
          if (state.bookList.isNotEmpty) {
            autoScrollToEnd();
          }
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(bottom: 20),
              physics: const BouncingScrollPhysics(),
              itemCount: state.bookList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 15, top: 5),
                child: ImageBookItem(
                  imageUrl:
                      state.bookList[index].volumeInfo!.imageLinks!.thumbnail!,
                ),
              ),
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: CustomErrorWidget(errorMessage: state.errorMessage));
        } else {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: const CustomLoadingIndicator());
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
