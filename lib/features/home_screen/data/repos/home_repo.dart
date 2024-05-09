import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Book>>> fetchNewsBooks();
  Future<Either<Failure, List<Book>>> fetchSimilarBooks(
      {required String category});
}
