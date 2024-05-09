import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/core/utils/api_methods/api_methods.dart';
import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:book_app/features/home_screen/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


//Single Responsibility Principle
class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks() async {
    return await FeaturedBooks.getFeaturedBooks();
  }

  @override
  Future<Either<Failure, List<Book>>> fetchNewsBooks() async {
    return await NewsBooks.getNewsBooks();
  }

  @override
  Future<Either<Failure, List<Book>>> fetchSimilarBooks({
    required String category,
  }) async {
    return await FeaturedBooks.getFeaturedBooks();
  }
}


//Clean Code
class NewsBooks {
  static Future<Either<Failure, List<Book>>> getNewsBooks() async {
    try {
      return right(
        convertJsonToModel(
          await getJsonData(
            endPoint: '/volumes',
            queryParameters: {
              'q': 'programming',
            },
          ),
        ),
      );
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

class FeaturedBooks {
  static Future<Either<Failure, List<Book>>> getFeaturedBooks() async {
    try {
      return right(
        convertJsonToModel(
          await getJsonData(
            endPoint: '/volumes',
            queryParameters: {
              'Filtering': 'free-ebooks',
              'q': 'programming',
            },
          ),
        ),
      );
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

class SimilarBooks {
  static Future<Either<Failure, List<Book>>> getSimilarBooks() async {
    try {
      return right(
        convertJsonToModel(
          await getJsonData(
            endPoint: '/volumes',
            queryParameters: {
              'Filtering': 'free-ebooks',
              'q': 'programming',

            },
            
          ),
        ),
      );
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

List<Book> convertJsonToModel(jsonData) {
  List<Book> books = [];
  for (var element in jsonData['items']) {
    books.add(Book.fromJson(element));
  }
  return books;
}


Future<Map<String, dynamic>> getJsonData(
    {required String endPoint, Map<String, dynamic>? queryParameters}) async {
  Map<String, dynamic> jsonData = await Api().get(
    endPoint: endPoint,
    queryParameters: queryParameters,
  );
  return jsonData;
}
