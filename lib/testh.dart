// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Book {
  List getBooks();
}

class NewsBook extends Book {
  @override
  List getBooks() {
    return [];
  }
}

class CubitNewsBook {
  late Book _book;
  CubitNewsBook(
    Book book,
  ) {
    _book = book;
  }
  List getBooks() {
    return _book.getBooks();
  }
}

void main(List<String> args) {
  CubitNewsBook c = CubitNewsBook(NewsBook());
  c.getBooks();
}
