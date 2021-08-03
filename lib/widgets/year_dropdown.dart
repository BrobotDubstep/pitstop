import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/models/season_table.dart';
import 'package:pitstop/providers/season_provider.dart';

class YearDropDown extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final seasons = watch(seasonProvider);
    final filter = watch(yearFilter);
    return seasons.when(
        data: (data) => DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: filter.state,
                  onChanged: (String? newValue) {
                    filter.state = newValue!;
                  },
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 40,
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
