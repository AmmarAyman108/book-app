import 'package:book_app/core/utils/widgets/custom_error_widget.dart';
import 'package:book_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:book_app/features/home_screen/presentation/manage/news_books_cubit/news_books_cubit.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/best_seller_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBooksCubit, NewsBooksState>(
      builder: (context, state) {
        if (state is NewsBooksFailure) {
          return SliverFillRemaining(
              hasScrollBody: false,
              child: CustomErrorWidget(errorMessage: state.errorMessage));
        } else if (state is NewsBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.bookList.length,
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ItemTile(
                  book: state.bookList[index],
                ),
              ),
            ),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: CustomLoadingIndicator(),
          );
        }
      },
    );
  }
}
