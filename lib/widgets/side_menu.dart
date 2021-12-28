import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final int selectedIndex;
  final Function setIndex;

  SideMenu({required this.selectedIndex, required this.setIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: 280.0,
      child: Column(children: [
        Padding(
            padding: EdgeInsets.only(
                top: 30.0, left: 16.0, right: 16.0, bottom: 10.0),
            child: Image.asset(
              'assets/logo_placeholder.png',
              height: 55.0,
              filterQuality: FilterQuality.high,
            )),
        /*_SideMenuListItem(
            selected: this.selectedIndex == 0,
            iconData: Icons.home,
            title: "Home",
            onTap: () => {this.setIndex(0)}),*/
        _SideMenuListItem(
            selected: this.selectedIndex == 0,
            iconData: Icons.sports_motorsports,
            title: "Drivers",
            onTap: () => {this.setIndex(0)}),
        _SideMenuListItem(
            selected: this.selectedIndex == 1,
            iconData: Icons.handyman,
            title: "Constructors",
            onTap: () => {this.setIndex(1)}),
        _SideMenuListItem(
            selected: this.selectedIndex == 2,
            iconData: Icons.sports_score,
            title: "Races",
            onTap: () => {this.setIndex(2)}),

      ]),
    );
  }
}

class _SideMenuListItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  final bool selected;

  const _SideMenuListItem(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTap,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        selected: this.selected,
        leading: Icon(iconData, size: 28.0),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onTap,
      ),
    );
  }
}
