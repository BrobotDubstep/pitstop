import 'package:flutter/material.dart';
import 'package:pitstop/screens/drivers_screen.dart';
import 'package:pitstop/screens/home_screen.dart';
import 'package:pitstop/widgets/side_menu.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  _AppRouterState createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800)
            SideMenu(
              selectedIndex: _navIndex,
              setIndex: (int index) {
                setState(() {
                  this._navIndex = index;
                });
              },
            ),
          Expanded(
            child: Builder(builder: (context) {
              switch (this._navIndex) {
                case 0:
                  return HomeScreen();
                case 1:
                  return DriversScreen();
                case 2:
                  return DriversScreen();
                case 3:
                  return DriversScreen();
                default:
                  return HomeScreen();
              }
            }),
          )
        ],
      ),
    );
  }
}
