import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
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
        _SideMenuListItem(iconData: Icons.home, title: "Home", onTap: () => {}),
        _SideMenuListItem(
            iconData: Icons.timer, title: "Results", onTap: () => {}),
        _SideMenuListItem(
            iconData: Icons.groups, title: "Drivers", onTap: () => {}),
        _SideMenuListItem(
            iconData: Icons.handyman, title: "Constructors", onTap: () => {}),
      ]),
    );
  }
}

class _SideMenuListItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuListItem(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData, size: 28.0),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
