import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(
        book: book,
      ),
    );
  }
}
