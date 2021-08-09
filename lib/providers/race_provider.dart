import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/models/race_table.dart';
import 'package:pitstop/providers/season_provider.dart';
import 'package:pitstop/repositories/race_repository.dart';

final racesRepositoryProvider = Provider<RaceRepository>((ref) {
  return RaceRepositoryImpl();
});

final racesForYearProvider = FutureProvider<List<Race>>((ref) async {
  final filter = ref.watch(yearFilter);
  if (filter.state != "") {
    final races =
        await ref.watch(racesRepositoryProvider).getRacesForYear(filter.state);
    return races;
  } else {
    return [];
  }
});
