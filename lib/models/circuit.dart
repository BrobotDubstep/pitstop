class Circuit {
  Circuit({
    required this.circuitId,
    required this.url,
    required this.circuitName,
    required this.location,
  });

  String circuitId;
  String url;
  String circuitName;
  Location location;

  factory Circuit.fromJson(Map<String, dynamic> json) => Circuit(
        circuitId: json["circuitId"],
        url: json["url"],
        circuitName: json["circuitName"],
        location: Location.fromJson(json["Location"]),
      );
}

class Location {
  Location({
    required this.lat,
    required this.long,
    required this.locality,
    required this.country,
  });

  String lat;
  String long;
  String locality;
  String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"],
        long: json["long"],
        locality: json["locality"],
        country: json["country"],
      );
}
