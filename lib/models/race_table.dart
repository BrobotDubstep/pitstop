import 'package:pitstop/models/circuit.dart';

class RaceTable {
  RaceTable({
    required this.season,
    required this.races,
  });

  String season;
  List<Race> races;

  factory RaceTable.fromJson(Map<String, dynamic> json) => RaceTable(
        season: json["season"],
        races: List<Race>.from(json["Races"].map((x) => Race.fromJson(x))),
      );
}

class Race {
  Race({
    required this.season,
    required this.round,
    required this.url,
    required this.raceName,
    required this.circuit,
    required this.date,
    required this.time,
  });

  String season;
  String round;
  String url;
  String raceName;
  Circuit circuit;
  DateTime date;
  String time;

  factory Race.fromJson(Map<String, dynamic> json) => Race(
        season: json["season"],
        round: json["round"],
        url: json["url"],
        raceName: json["raceName"],
        circuit: Circuit.fromJson(json["Circuit"]),
        date: DateTime.parse(json["date"]),
        time: json["time"],
      );
}
