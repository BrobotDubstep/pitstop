class SeasonTable {
  SeasonTable({
    required this.seasons,
  });

  List<Season> seasons;

  factory SeasonTable.fromJson(Map<String, dynamic> json) => SeasonTable(
        seasons:
            List<Season>.from(json["Seasons"].map((x) => Season.fromJson(x))),
      );
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
}
