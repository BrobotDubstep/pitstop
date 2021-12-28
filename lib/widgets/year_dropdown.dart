import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/models/season_table.dart';
import 'package:pitstop/providers/season_provider.dart';

class DropdownHeading extends StatelessWidget {
  final String title;

  DropdownHeading({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        this.title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
      Row(
        children: [
          Text(
            "Season ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          YearDropDown()
        ],
      )
      /*Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: YearDropDown(),
      )*/
    ]);
  }
}

class YearDropDown extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seasons = ref.watch(seasonProvider);
    final filter = ref.watch(yearFilter.state);
    return seasons.when(
        data: (data) => DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: filter.state,
                  onChanged: (String? newValue) {
                    filter.state = newValue!;
                  },
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  items: data.map<DropdownMenuItem<String>>((Season value) {
                    return DropdownMenuItem<String>(
                      value: value.season,
                      child: Text(value.season),
                    );
                  }).toList()),
            ),
        loading: () => CircularProgressIndicator(),
        error: (error, stack) => Text(error.toString()));
  }
}
