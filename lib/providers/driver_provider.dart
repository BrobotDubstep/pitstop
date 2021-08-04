import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/models/driver_table.dart';
import 'package:pitstop/providers/season_provider.dart';
import 'package:pitstop/repositories/driver_repository.dart';

final driversRepositoryProvider = Provider<DriverRepository>((ref) {
  return DriverRepositoryImpl();
});

final driversForYearProvider = FutureProvider<List<Driver>>((ref) async {
  final filter = ref.watch(yearFilter);
  if (filter.state != "") {
    final drivers = await ref
        .watch(driversRepositoryProvider)
        .getDriversForSelectedYear(filter.state);
    return drivers;
  } else {
    return [];
  }
});
