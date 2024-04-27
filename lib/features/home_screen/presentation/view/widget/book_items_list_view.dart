import 'package:book_app/core/utils/widgets/custom_error_widget.dart';
import 'package:book_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home_screen/presentation/manage/featured_cubit/featured_book_cubit.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/image_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookItemListView extends StatelessWidget {
  const FeaturedBookItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(bottom: 20),
              physics: const BouncingScrollPhysics(),
              itemCount: state.bookList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 15),
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
}
