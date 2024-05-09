import 'package:book_app/features/home_screen/data/models/book_model/book_model.dart';
import 'package:book_app/features/home_screen/presentation/manage/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/home_screen/presentation/view/book_details_view.dart';
import 'package:book_app/features/home_screen/presentation/view/home_view.dart';
import 'package:book_app/features/search_screen/presentation/view/search_view.dart';
import 'package:book_app/features/splash_screen/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSplashView = '/';
  static const String kHomeView = '/HomeView';
  static const String kBookView = '/BookView';
  static const String kSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(),
          child: BookDetailsView(book: state.extra as Book),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
    // errorPageBuilder: (context, state) => ,
  );
}
