import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pitstop/models/constructor_table.dart';
import 'package:pitstop/models/standings.dart';
import 'package:pitstop/providers/driver_provider.dart';
import 'package:pitstop/providers/season_provider.dart';
import 'package:pitstop/widgets/data_grid.dart';
import 'package:pitstop/widgets/data_list_entry.dart';
import 'package:pitstop/widgets/year_dropdown.dart';

class DriversScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02, top: 20),
                  child: DropdownHeading(
                    title: "Drivers of",
                  ),
                ),
              ],
            ),
            DriverGrid(),
          ],
        ),
      ),
    );
  }
}

class DriverGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drivers = ref.watch(driverStandingForYearProvider);
    return drivers.when(
        data: (data) => Expanded(
              child: DataGrid(
                  cards: data.map((data) {
                return DriverCard(data);
              }).toList()),
            ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text(error.toString()));
  }
}

class DriverCard extends ConsumerWidget {
  final DriverStanding driverStanding;
  final dateFormat = DateFormat("dd.MM.yyyy");

  DriverCard(this.driverStanding);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = ref.watch(yearFilter.state);
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            DriverListTile(
                name:
                    "${this.driverStanding.driver.givenName} ${this.driverStanding.driver.familyName}",
                constructor: this.driverStanding.constructors,
                permanentNumber: this.driverStanding.driver.permanentNumber),
            DataListEntry(
                title: "Nationality:",
                description: this.driverStanding.driver.nationality),
            DataListEntry(
                title: "Birthday:",
                description: this
                    .dateFormat
                    .format(this.driverStanding.driver.dateOfBirth)),
            (this.driverStanding.driver.code != null)
                ? DataListEntry(
                    title: "Driver Code:",
                    description: this.driverStanding.driver.code!,
                  )
                : Container(),
            DataListEntry(
                title: "Wins in ${year.state}:",
                description: this.driverStanding.wins),
            DataListEntry(
                title: "Points in ${year.state}:",
                description: this.driverStanding.points),
            DataListEntry(
              title: "Championship Standing:",
              description: this.driverStanding.position,
            ),
          ],
        ));
  }
}

class DriverListTile extends StatelessWidget {
  final String name;
  final List<Constructor> constructor;
  final String? permanentNumber;

  DriverListTile(
      {required this.name, required this.constructor, this.permanentNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                this.constructor.map((val) => val.name).join(', '),
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
          this.permanentNumber != null
              ? CircleAvatar(
                  radius: 25, child: Text(this.permanentNumber.toString()))
              : Container(),
        ],
      ),
    );
  }
}
