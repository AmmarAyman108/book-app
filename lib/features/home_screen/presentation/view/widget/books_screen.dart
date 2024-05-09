import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/best_seller_list_view.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/book_items_list_view.dart';
import 'package:flutter/material.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({
    super.key,
  });

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Images.logo,
          height: 23,
        ),
        // actions: [
        //   IconButton(
        //     padding: const EdgeInsets.only(right: 10),
        //     onPressed: () {
        //       GoRouter.of(context).push(AppRouter.kSearchView);
        //     },
        //     icon: const Icon(
        //       FontAwesomeIcons.magnifyingGlass,
        //       size: 22,
        //       color: Colors.white,
        //     ),
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // SliverToBoxAdapter(child: CustomAppBar()),
            SliverToBoxAdapter(child: FeaturedBookItemListView()),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 30, bottom: 15),
                child: Text(
                  'News Book ',
                  style: Styles.textStyle20,
                ),
              ),
            ),
            const Expanded(child: BestSellerListView())
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
