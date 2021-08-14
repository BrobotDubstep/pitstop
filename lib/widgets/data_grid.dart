import 'package:flutter/material.dart';

class DataGrid extends StatelessWidget {
  final List<Widget> cards;

  DataGrid({required this.cards});

  // Returns the count of columns based on the width of the device
  int _getColumnCount(BuildContext context) {
    int count = MediaQuery.of(context).size.width ~/ 450;
    return count > 0 ? count : 1;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getColumnCount(context),
          mainAxisExtent: 300,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02, vertical: 20),
        itemCount: this.cards.length,
        itemBuilder: (context, index) {
          return this.cards[index];
        });
  }
}
