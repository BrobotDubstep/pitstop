import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pitstop/widgets/year_dropdown.dart';

class DriversScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Row(children: [
                  Text(
                    'Drivers of ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  YearDropDown()
                ]),
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(100, (index) {
                return Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Card(
                      child: Text('$index'),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
