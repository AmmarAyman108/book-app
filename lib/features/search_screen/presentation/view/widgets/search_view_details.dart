
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/search_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:book_app/features/search_screen/presentation/view/widgets/result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewDetails extends StatelessWidget {
  const SearchViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
          title: const Text(
            'Search',
            style: Styles.textStyle25,
          )),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            // SliverToBoxAdapter(
            //   child: CustomSearchViewAppBar(),
            // ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(child: CustomTextField()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'result book',
                style: Styles.textStyle20,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            ResultListView()
          ],
        ),
      )),
    );
  }
}
