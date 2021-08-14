import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/models/constructor_table.dart';
import 'package:pitstop/models/standings.dart';
import 'package:pitstop/providers/constructor_provider.dart';
import 'package:pitstop/providers/season_provider.dart';
import 'package:pitstop/widgets/data_grid.dart';
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
                      left: MediaQuery.of(context).size.width * 0.02, top: 20),
                  child: DropdownHeading(
                    title: "Constructors of",
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
  Widget build(BuildContext context, ScopedReader watch) {
    final year = watch(yearFilter).state;
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
  Widget build(BuildContext context, ScopedReader watch) {
    final constructors = watch(constructorsStandingForYearProvider);
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
  Widget build(BuildContext context, ScopedReader watch) {
    final constructors = watch(constructorsForYearProvider);
    return constructors.when(
        data: (data) => Expanded(
                child: CardGrid(
              constructor: data,
            )),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text(error.toString()));
  }
}

class ConstructorCard extends StatelessWidget {
  final Constructor? constructor;
  final ConstructorStanding? constructorStanding;

  ConstructorCard({this.constructor, this.constructorStanding});

  @override
  Widget build(BuildContext context) {
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
                  Text(this.constructorStanding!.constructor.name),
                  Text(this.constructorStanding!.constructor.nationality),
                  Text(this.constructorStanding!.wins),
                  Text(this.constructorStanding!.points),
                  Text(this.constructorStanding!.position)
                ],
              );
            } else if (constructor != null) {
              return Column(children: [
                Text(this.constructor!.name),
                Text(this.constructor!.nationality),
              ]);
            } else {
              return Text("No data for this year");
            }
          })),
        ));
  }
}
