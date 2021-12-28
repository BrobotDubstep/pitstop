import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/providers/season_provider.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _seasons = ref.watch(seasonProvider);
    return SafeArea(
      child: Center(
          child: Container(
        child: _seasons.when(
            data: (data) => Text("Home"),
            loading: () => CircularProgressIndicator(),
            error: (error, stack) => Text(error.toString())),
      )),
    );
  }
}
