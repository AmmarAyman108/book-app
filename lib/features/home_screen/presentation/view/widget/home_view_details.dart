// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/best_seller_list_view.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/book_items_list_view.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/custom_home_view_app_bar.dart';

class HomeViewDetails extends StatelessWidget {
  const HomeViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CustomAppBar()),
            SliverToBoxAdapter(child: FeaturedBookItemListView()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 50, bottom: 10),
                child: Text(
                  'News Book ',
                  style: Styles.textStyle20,
                ),
              ),
            ),
            BestSellerListView()
          ],
        ),
      ),
    );
  }
}


