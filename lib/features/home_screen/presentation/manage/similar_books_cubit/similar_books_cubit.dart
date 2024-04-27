import 'package:bloc/bloc.dart';
import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:book_app/features/home_screen/data/repos/home_repo_imp.dart';
import 'package:meta/meta.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit() : super(SimilarBooksInitial());
   fetchSimilarBooks({required String category})async{
    emit(SimilarBooksLoading());
    var result = await HomeRepoImpl().fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccess(bookList: books));
    });}
}
