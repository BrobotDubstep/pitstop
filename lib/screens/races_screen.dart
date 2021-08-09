import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/models/race_table.dart';
import 'package:pitstop/providers/race_provider.dart';
import 'package:pitstop/widgets/year_dropdown.dart';

class RacesScreen extends StatelessWidget {
  const RacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.02, top: 20),
                child: Row(children: [
                  Text(
                    'Races of ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  YearDropDown()
                ]),
              ),
            ],
          ),
          RaceGrid(),
        ],
      ),
    );
  }
}

class RaceGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final races = watch(racesForYearProvider);
    return races.when(
        data: (data) => Expanded(
            child: GridView.count(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02,
                    vertical: 20),
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: data.map((data) {
                  return RaceCard(data);
                }).toList())),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text(error.toString()));
  }
}

class RaceCard extends StatelessWidget {
  final Race race;

  RaceCard(this.race);

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
                Text(this.race.raceName),
                Text(this.race.round),
                Text(this.race.season),
                Text(this.race.circuit.circuitName),
                Text(this.race.date.toString()),
                this.race.time != null
                    ? Text(this.race.time.toString())
                    : Text("No time available")
              ],
            ),
          ),
        ));
  }
}
