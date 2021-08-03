import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pitstop/models/season_table.dart';
import 'package:pitstop/repositories/season_repository.dart';

final seasonRepositoryProvider = Provider<SeasonRepository>((ref) {
  return SeasonRepositoryImpl();
});

final seasonProvider = FutureProvider<List<Season>>((ref) async {
  final filter = ref.read(yearFilter);
  final seasons = await ref.watch(seasonRepositoryProvider).getAllSeasons();
  filter.state = seasons[0].season;
  return seasons;
});

final yearFilter = StateProvider((_) => "");
