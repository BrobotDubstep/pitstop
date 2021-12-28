import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pitstop/models/constructor_table.dart';
import 'package:pitstop/models/standings.dart';
import 'package:pitstop/providers/constructor_provider.dart';
import 'package:pitstop/providers/season_provider.dart';
import 'package:pitstop/widgets/data_grid.dart';
import 'package:pitstop/widgets/data_list_entry.dart';
import 'package:pitstop/widgets/year_dropdown.dart';

class ConstructorsScreen extends StatelessWidget {
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
                    left: MediaQuery.of(context).size.width * 0.02, top: 20
                  ),
                  child: DropdownHeading(
                    title: "Constructors",
                  ),                    
                ),
              ],
            ),
            ConstructorGridWrapper(),
          ],
        ),
      ),
    );
  }
}

class ConstructorGridWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = ref.watch(yearFilter.state).state;
    return (int.parse(year) > 1957)
        ? ConstructorStandingGrid()
        : ConstructorGrid();
  }
}

class CardGrid extends StatelessWidget {
  final List<ConstructorStanding>? constructorStanding;
  final List<Constructor>? constructor;

  CardGrid({this.constructorStanding, this.constructor});

  @override
  Widget build(BuildContext context) {
    return DataGrid(
        cards: (this.constructorStanding != null)
            ? constructorStanding!.map((data) {
                return ConstructorCard(constructorStanding: data);
              }).toList()
            : constructor!.map((data) {
                return ConstructorCard(constructor: data);
              }).toList());
  }
}

class ConstructorStandingGrid extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constructors = ref.watch(constructorsStandingForYearProvider);
    return constructors.when(
        data: (data) => Expanded(
                child: CardGrid(
              constructorStanding: data,
            )),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text(error.toString()));
  }
}

class ConstructorGrid extends ConsumerWidget {
  const ConstructorGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constructors = ref.watch(constructorsForYearProvider);
    return constructors.when(
        data: (data) => Expanded(
                child: CardGrid(
              constructor: data,
            )),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text(error.toString()));
  }
}

class ConstructorCard extends ConsumerWidget {
  final Constructor? constructor;
  final ConstructorStanding? constructorStanding;
  final dateFormat = DateFormat("dd.MM.yyyy");

  ConstructorCard({this.constructor, this.constructorStanding});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = ref.watch(yearFilter.state);
    return Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          height: 400,
          width: 200,
          child: Center(child: Builder(builder: (context) {
            if (constructorStanding != null) {
              return Column(
                children: [
                  ConstructorListTile(name: constructorStanding!.constructor.name,),
                  DataListEntry(title: "Nationality:", description: constructorStanding!.constructor.nationality),
                  DataListEntry(title: "Points in ${year.state}:", description: this.constructorStanding!.points),
                  DataListEntry(title: "Championship Standing:", description: this.constructorStanding!.position),
                ],
              );
            } else if (constructor != null) {
              return Column(children: [
                ConstructorListTile(name: constructor!.name,),
                DataListEntry(title: "Nationality:", description: constructor!.nationality),
              ]);
            } else {
              return Text("No data for this year");
            }
          })),
        ));
  }
}

class ConstructorListTile extends StatelessWidget {
  final String name;
  
  ConstructorListTile({required this.name});

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
            ],
          ),
        ],
      ),
    );
  }
}
