import 'package:bloc/bloc.dart';
import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:book_app/features/home_screen/data/repos/home_repo_imp.dart';
import 'package:meta/meta.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit() : super(FeaturedBookInitial());
  Future<void> fetchFeaturedBook() async {
    emit(FeaturedBookLoading());
    var result = await HomeRepoImpl().fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBookFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(FeaturedBookSuccess(bookList: books));
    });
  }
}
