import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/providers/season_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _seasons = watch(seasonProvider);
    return Center(
        child: Container(
      child: _seasons.when(
          data: (data) => Text("Home"),
          loading: () => CircularProgressIndicator(),
          error: (error, stack) => Text(error.toString())),
    ));
  }
}
