part of 'featured_book_cubit.dart';

@immutable
sealed class FeaturedBookState {}

final class FeaturedBookInitial extends FeaturedBookState {}

final class FeaturedBookLoading extends FeaturedBookState {}

final class FeaturedBookSuccess extends FeaturedBookState {
  final List<Book> bookList;
  FeaturedBookSuccess({required this.bookList});
}

final class FeaturedBookFailure extends FeaturedBookState {
  final String errorMessage;
  FeaturedBookFailure({required this.errorMessage});
}
