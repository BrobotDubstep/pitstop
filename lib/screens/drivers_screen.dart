import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 30.0),
              child: Text(
                'Drivers of 2021',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
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
    );
  }
}
