class SeasonTable {
  SeasonTable({
    required this.seasons,
  });

  List<Season> seasons;

  factory SeasonTable.fromJson(Map<String, dynamic> json) => SeasonTable(
        seasons:
            List<Season>.from(json["Seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
      };
}

class Season {
  Season({
    required this.season,
    required this.url,
  });

  String season;
  String url;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        season: json["season"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "season": season,
        "url": url,
      };
}
