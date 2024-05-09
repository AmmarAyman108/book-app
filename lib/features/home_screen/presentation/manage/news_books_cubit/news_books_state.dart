part of 'news_books_cubit.dart';

@immutable
sealed class NewsBooksState {}

final class NewsBooksInitial extends NewsBooksState {}

final class NewsBooksLoading extends NewsBooksState {}

final class NewsBooksSuccess extends NewsBooksState {
  final List<Book> bookList;
  NewsBooksSuccess({required this.bookList});
}

final class NewsBooksFailure extends NewsBooksState {
  final String errorMessage;
  NewsBooksFailure({required this.errorMessage});
}
