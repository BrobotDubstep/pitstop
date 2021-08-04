class DriverTable {
  DriverTable({
    required this.season,
    required this.drivers,
  });

  String season;
  List<Driver> drivers;

  factory DriverTable.fromJson(Map<String, dynamic> json) => DriverTable(
        season: json["season"],
        drivers:
            List<Driver>.from(json["Drivers"].map((x) => Driver.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "season": season,
        "Drivers": List<dynamic>.from(drivers.map((x) => x.toJson())),
      };
}

class Driver {
  Driver({
    required this.driverId,
    required this.permanentNumber,
    required this.code,
    required this.url,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality,
  });

  String driverId;
  String permanentNumber;
  String code;
  String url;
  String givenName;
  String familyName;
  DateTime dateOfBirth;
  String nationality;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        driverId: json["driverId"],
        permanentNumber: json["permanentNumber"],
        code: json["code"],
        url: json["url"],
        givenName: json["givenName"],
        familyName: json["familyName"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        nationality: json["nationality"],
      );

  Map<String, dynamic> toJson() => {
        "driverId": driverId,
        "permanentNumber": permanentNumber,
        "code": code,
        "url": url,
        "givenName": givenName,
        "familyName": familyName,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "nationality": nationality,
      };
}
