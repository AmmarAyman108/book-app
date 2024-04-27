import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/core/utils/api_methods/api_methods.dart';
import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:book_app/features/home_screen/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    return FeaturedBooks.get();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks() async {
    return NewsBooks.get();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    return FeaturedBooks.get();
  }
}

class NewsBooks {
  static Future<Either<Failure, List<BookModel>>> get() async {
    try {
      var json = await Api().get(
        endPoint: '/volumes',
        queryParameters: {
          'q': 'programming',
        },
      );

      List<BookModel> booksListModel = covertMapToModel(json);
      return right(booksListModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

List<BookModel> covertMapToModel(json) {
  List<BookModel> booksListModel = [];
  for (var element in json['items']) {
    booksListModel.add(BookModel.fromJson(element));
  }
  return booksListModel;
}

class FeaturedBooks {
  static Future<Either<Failure, List<BookModel>>> get() async {
    try {
      var json = await Api().get(
        endPoint: '/volumes',
        queryParameters: {
          'Filtering': 'free-ebooks',
          'q': 'programming',
        },
      );

      List<BookModel> booksListModel = covertMapToModel(json);

      return right(booksListModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

class SimilarBooks {
  static Future<Either<Failure, List<BookModel>>> get() async {
    try {
      var json = await Api().get(
        endPoint: '/volumes',
        queryParameters: {
          'q': 'programming',
          "Sorting": "relevance",
          'Filtering': 'free-ebooks',
        },
      );

      List<BookModel> booksListModel = covertMapToModel(json);
      return right(booksListModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
