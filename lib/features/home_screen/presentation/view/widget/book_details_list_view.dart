import 'package:book_app/features/home_screen/presentation/view/widget/image_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(right: 12),
            child: ImageBookItem(imageUrl: 'https://c4.wallpaperflare.com/wallpaper/253/947/731/windows-10-windows-10x-windows-11-minimalism-material-minimal-hd-wallpaper-preview.jpg',),
          ),
        ),
      ),
    );
  }
}
