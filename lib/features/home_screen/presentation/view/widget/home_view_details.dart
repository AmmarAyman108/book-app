import 'package:book_app/core/utils/style.dart';
import 'package:book_app/features/home_screen/presentation/view/widget/books_screen.dart';
import 'package:book_app/features/search_screen/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class HomeViewDetails extends StatefulWidget {
  const HomeViewDetails({super.key});

  @override
  State<HomeViewDetails> createState() => _HomeViewDetailsState();
}

class _HomeViewDetailsState extends State<HomeViewDetails> {
  int currentIndex = 0;
  List<Widget> screens = const [
    BooksScreen(),
    Center(
      child: Text(
        'Soon!',
        style: Styles.textStyle20,
      ),
    ),
    SearchView(),
    Center(
      child: Text(
        'Soon!',
        style: Styles.textStyle20,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: MediaQuery.of(context).size.width * .03,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            elevation: 0,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            backgroundColor: const Color.fromARGB(255, 41, 35, 58),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey.withOpacity(.4),
            showSelectedLabels: false,
            unselectedIconTheme: const IconThemeData(
              size: 20,
              color: Colors.grey,
            ),
            selectedIconTheme:
                const IconThemeData(size: 24, color: Colors.white),
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Icon(FontAwesomeIcons.book),
                  ),
                  label: 'books'),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidBookmark),
                label: 'solidBookmark',
                backgroundColor: Colors.transparent,
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                ),
                label: 'magnifyingGlass',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(FontAwesomeIcons.cartShopping),
                label: 'cartShopping',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
