import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pitstop/models/race_table.dart';
import 'package:pitstop/providers/race_provider.dart';
import 'package:pitstop/widgets/data_grid.dart';
import 'package:pitstop/widgets/data_list_entry.dart';
import 'package:pitstop/widgets/year_dropdown.dart';

class RacesScreen extends StatelessWidget {
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
                      title: "Races",
                    ),                    
                  ),
              ],
            ),
            RaceGrid(),
          ],
        ),
      ),
    );
  }
}

class RaceGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final races = ref.watch(racesForYearProvider);
    return races.when(
        data: (data) => Expanded(
                child: DataGrid(
              cards: data.map((data) {
                return RaceCard(data);
              }).toList(),
            )),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text(error.toString()));
  }
}

class RaceCard extends StatelessWidget {
  final dateFormat = DateFormat("dd.MM.yyyy");
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
                RaceListTile(name: this.race.raceName, trackName: this.race.circuit.circuitName,),
                DataListEntry(title: "Round:", description: this.race.round),
                DataListEntry(title: "Date:", description: dateFormat.format(this.race.date)),
                DataListEntry(
                  title: "Lights out:", 
                  description: this.race.time != null
                    ? this.race.time!
                    : "No time available"
                )
                
              ],
            ),
          ),
        ));
  }
}

class RaceListTile extends StatelessWidget {
  final String name;
  final String trackName;
  
  RaceListTile({required this.name, required this.trackName});

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
                this.trackName,
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        ],
      ),
    );
  }
}
