import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/models/standings.dart';
import 'package:pitstop/providers/driver_provider.dart';
import 'package:pitstop/widgets/year_dropdown.dart';

class ConstructorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02,
                  top: 20,
                  bottom: 20,
                ),
                child: Row(children: [
                  Text(
                    'Constructors of ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  YearDropDown()
                ]),
              ),
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
    final drivers = watch(driverStandingForYearProvider);
    return drivers.when(
        data: (data) => Expanded(
            child: GridView.count(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: data.map((data) {
                  return DriverCard(data);
                }).toList())),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text(error.toString()));
  }
}

class DriverCard extends StatelessWidget {
  final DriverStanding driverStanding;

  DriverCard(this.driverStanding);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          height: 400,
          width: 200,
          child: Center(
            child: Column(
              children: [
                Text(this.driverStanding.driver.givenName +
                    " " +
                    this.driverStanding.driver.familyName),
                Text(this.driverStanding.driver.nationality),
                Text(this.driverStanding.constructors[0].name),
                Text(this.driverStanding.points)
              ],
            ),
          ),
        ));
  }
}
