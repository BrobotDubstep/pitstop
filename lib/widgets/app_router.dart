import 'package:flutter/material.dart';
import 'package:pitstop/screens/constructors_screen.dart';
import 'package:pitstop/screens/drivers_screen.dart';
import 'package:pitstop/screens/races_screen.dart';
import 'package:pitstop/widgets/side_menu.dart';

class AppRouter extends StatefulWidget {
  @override
  _AppRouterState createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    //HomeScreen(),
    DriversScreen(),
    ConstructorsScreen(),
    RacesScreen(),

  ];

  //Checks if device is phone or tablet
  String _checkDeviceType(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 800 ? 'mobile' : 'desktop';
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = _checkDeviceType(context);
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return (deviceType == 'desktop')
        ? Scaffold(
            body: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800)
                  SideMenu(
                    selectedIndex: _selectedIndex,
                    setIndex: _onItemTapped,
                  ),
                Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
              ],
            ),
          )
        : Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                /*BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),*/
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_motorsports),
                  label: 'Drivers',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.handyman),
                  label: 'Constructors',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_score),
                  label: 'Races',
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
