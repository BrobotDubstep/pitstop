import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/models/constructor_table.dart';
import 'package:pitstop/models/standings.dart';
import 'package:pitstop/providers/season_provider.dart';
import 'package:pitstop/repositories/constructor_repository.dart';

final constructorsRepositoryProvider = Provider<ConstructorRepository>((ref) {
  return ConstructorRepositoryImpl();
});

final constructorsForYearProvider =
    FutureProvider<List<Constructor>>((ref) async {
  final filter = ref.watch(yearFilter.state);
  if (filter.state != "") {
    final drivers = await ref
        .watch(constructorsRepositoryProvider)
        .getConstructorsForSelectedYear(filter.state);
    return drivers;
  } else {
    return [];
  }
});

final constructorsStandingForYearProvider =
    FutureProvider<List<ConstructorStanding>>((ref) async {
  final filter = ref.watch(yearFilter.state);
  if (filter.state != "") {
    final drivers = await ref
        .watch(constructorsRepositoryProvider)
        .getConstructorStandingForYear(filter.state);
    return drivers;
  } else {
    return [];
  }
});
