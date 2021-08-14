import 'package:flutter/material.dart';

class DataListEntry extends StatelessWidget {
  final String title;
  final String description;

  DataListEntry({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              this.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            this.description,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
