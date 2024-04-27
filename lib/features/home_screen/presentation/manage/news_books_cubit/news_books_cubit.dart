import 'package:bloc/bloc.dart';
import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:book_app/features/home_screen/data/repos/home_repo_imp.dart';
import 'package:meta/meta.dart';

part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit() : super(NewsBooksInitial());
  Future<void> fetchNewsBooks() async {
    emit(NewsBooksLoading());
    var result = await HomeRepoImpl().fetchNewsBooks();
    result.fold((failure) {
      emit(NewsBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(NewsBooksSuccess(bookList: books));
    });
  }
}
