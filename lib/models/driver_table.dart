class DriverTable {
  DriverTable({
    required this.drivers,
  });

  List<Driver> drivers;

  factory DriverTable.fromJson(Map<String, dynamic> json) => DriverTable(
        drivers:
            List<Driver>.from(json["Drivers"].map((x) => Driver.fromJson(x))),
      );
}

class Driver {
  Driver({
    required this.driverId,
    required this.url,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality,
    this.permanentNumber,
    this.code,
  });

  String driverId;
  String url;
  String givenName;
  String familyName;
  DateTime dateOfBirth;
  String nationality;
  String? permanentNumber;
  String? code;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        driverId: json["driverId"],
        url: json["url"],
        givenName: json["givenName"],
        familyName: json["familyName"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        nationality: json["nationality"],
        permanentNumber:
            json["permanentNumber"] == null ? null : json["permanentNumber"],
        code: json["code"] == null ? null : json["code"],
      );
}
