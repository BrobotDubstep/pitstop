import 'package:pitstop/models/constructor_table.dart';
import 'package:pitstop/models/driver_table.dart';

class StandingsTable {
  StandingsTable({
    required this.season,
    required this.standingsLists,
  });

  String season;
  List<StandingsList> standingsLists;

  factory StandingsTable.fromJson(Map<String, dynamic> json) => StandingsTable(
        season: json["season"],
        standingsLists: List<StandingsList>.from(
            json["StandingsLists"].map((x) => StandingsList.fromJson(x))),
      );
}

class StandingsList {
  StandingsList(
      {required this.season,
      required this.round,
      this.driverStandings,
      this.constructorStandings});

  String season;
  String round;
  List<DriverStanding>? driverStandings;
  List<ConstructorStanding>? constructorStandings;

  factory StandingsList.fromJson(Map<String, dynamic> json) => StandingsList(
        season: json["season"],
        round: json["round"],
        driverStandings: json["DriverStandings"] != null
            ? List<DriverStanding>.from(
                json["DriverStandings"].map((x) => DriverStanding.fromJson(x)))
            : null,
        constructorStandings: json["ConstructorStandings"] != null
            ? List<ConstructorStanding>.from(json["ConstructorStandings"]
                .map((x) => ConstructorStanding.fromJson(x)))
            : null,
      );
}

class DriverStanding {
  DriverStanding({
    required this.position,
    required this.positionText,
    required this.points,
    required this.wins,
    required this.driver,
    required this.constructors,
  });

  String position;
  String positionText;
  String points;
  String wins;
  Driver driver;
  List<Constructor> constructors;

  factory DriverStanding.fromJson(Map<String, dynamic> json) => DriverStanding(
        position: json["position"],
        positionText: json["positionText"],
        points: json["points"],
        wins: json["wins"],
        driver: Driver.fromJson(json["Driver"]),
        constructors: List<Constructor>.from(
            json["Constructors"].map((x) => Constructor.fromJson(x))),
      );
}

class ConstructorStanding {
  ConstructorStanding({
    required this.position,
    required this.positionText,
    required this.points,
    required this.wins,
    required this.constructor,
  });

  String position;
  String positionText;
  String points;
  String wins;
  Constructor constructor;

  factory ConstructorStanding.fromJson(Map<String, dynamic> json) =>
      ConstructorStanding(
        position: json["position"],
        positionText: json["positionText"],
        points: json["points"],
        wins: json["wins"],
        constructor: Constructor.fromJson(json["Constructor"]),
      );
}
