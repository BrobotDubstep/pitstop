class ConstructorTable {
  ConstructorTable({
    required this.constructors,
  });

  List<Constructor> constructors;

  factory ConstructorTable.fromJson(Map<String, dynamic> json) =>
      ConstructorTable(
        constructors: List<Constructor>.from(
            json["Constructors"].map((x) => Constructor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Constructors": List<dynamic>.from(constructors.map((x) => x.toJson())),
      };
}

class Constructor {
  Constructor({
    required this.constructorId,
    required this.url,
    required this.name,
    required this.nationality,
  });

  String constructorId;
  String url;
  String name;
  String nationality;

  factory Constructor.fromJson(Map<String, dynamic> json) => Constructor(
        constructorId: json["constructorId"],
        url: json["url"],
        name: json["name"],
        nationality: json["nationality"],
      );

  Map<String, dynamic> toJson() => {
        "constructorId": constructorId,
        "url": url,
        "name": name,
        "nationality": nationality,
      };
}
