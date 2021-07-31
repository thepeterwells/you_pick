import 'package:you_pick/utils/ColorUtil.dart';
import 'package:you_pick/view/movies/list/MovieListScreen.dart';
import 'package:you_pick/view/placeholder/PlaceHolderWidget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {

  @override
  State createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    MovieListScreen(),
    PlaceholderWidget(Colors.green.shade200),
    PlaceholderWidget(Colors.blue.shade200)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('You Pick'),),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.primaryColor,
        selectedItemColor: AppTheme.secondaryColor,
        unselectedItemColor: AppTheme.primaryTextColor,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.favorite),
              label: "Favorites"
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              label: "Profile"
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}