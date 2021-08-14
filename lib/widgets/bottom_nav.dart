import 'package:flutter/material.dart';
import 'package:pitstop/screens/constructors_screen.dart';
import 'package:pitstop/screens/drivers_screen.dart';
import 'package:pitstop/screens/home_screen.dart';
import 'package:pitstop/screens/races_screen.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    RacesScreen(),
    DriversScreen(),
    ConstructorsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_score),
              label: 'Races',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_motorsports),
              label: 'Drivers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.handyman),
              label: 'Constructors',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Theme.of(context).primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ));
  }
}
