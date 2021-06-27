import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/favorites_screen.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/profile_screen.dart';
import 'package:movie_app/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: kBlackColor,
        selectedItemColor: kBlackColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.homeOutline),
            activeIcon: Icon(EvaIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.heartOutline),
            activeIcon: Icon(EvaIcons.heart),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
            activeIcon: Icon(EvaIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
