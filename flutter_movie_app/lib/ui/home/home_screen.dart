import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/movies_page.dart';
import 'pages/tv_series_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  final List screens = [
    MoviesPage(),
    TvSeriesPage(),
    AboutPage(),
  ];

  int _selectedNavbar = 0;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MoviesPage();

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
    _screenShow();
  }

  void _screenShow() {
    if (_selectedNavbar == 0) {
      currentScreen = MoviesPage();
    } else if (_selectedNavbar == 1) {
      currentScreen = TvSeriesPage();
    } else {
      currentScreen = AboutPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        backgroundColor: Color(0xff1b1b1b),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movies",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: "Tv Series",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "About",
          ),
        ],
        onTap: _changeSelectedNavBar,
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff858585),
        showUnselectedLabels: false,
      ),
    );
  }
}
