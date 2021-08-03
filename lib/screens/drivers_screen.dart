import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DriversScreen extends StatefulWidget {
  const DriversScreen({Key? key}) : super(key: key);

  @override
  _DriversScreenState createState() => _DriversScreenState();
}

class _DriversScreenState extends State<DriversScreen> {
  String dropdownValue = "2021";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 30.0),
              child: Row(children: [
                Text(
                  'Drivers of ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                      value: dropdownValue,
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['2021', '2020', '2019', '2018']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                )
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
    );
  }
}
