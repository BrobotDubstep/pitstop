import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/providers/driver_provider.dart';
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
              Row(children: [
                Text(
                  'Drivers of ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                YearDropDown()
              ]),
            ],
          ),
          DriverGrid(),
        ],
      ),
    );
  }
}

class DriverGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final drivers = watch(driversForYearProvider);
    return drivers.when(
        data: (data) => Expanded(
            child: GridView.count(
                crossAxisCount: 4,
                children: data.map((data) {
                  return Container(
                    height: 300,
                    width: 300,
                    child: Card(
                      child: Text(data.familyName),
                    ),
                  );
                }).toList())),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text(error.toString()));
  }
}
