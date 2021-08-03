import 'dart:convert';
import 'season_table.dart';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  BaseModel({
    required this.mrData,
  });

  MrData mrData;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        mrData: MrData.fromJson(json["MRData"]),
      );

  Map<String, dynamic> toJson() => {
        "MRData": mrData.toJson(),
      };
}

class MrData {
  MrData({
    required this.xmlns,
    required this.series,
    required this.url,
    required this.limit,
    required this.offset,
    required this.total,
    this.seasonTable,
  });

  String xmlns;
  String series;
  String url;
  String limit;
  String offset;
  String total;
  SeasonTable? seasonTable;

  factory MrData.fromJson(Map<String, dynamic> json) => MrData(
        xmlns: json["xmlns"],
        series: json["series"],
        url: json["url"],
        limit: json["limit"],
        offset: json["offset"],
        total: json["total"],
        seasonTable: SeasonTable.fromJson(json["SeasonTable"]),
      );

  Map<String, dynamic> toJson() => {
        "xmlns": xmlns,
        "series": series,
        "url": url,
        "limit": limit,
        "offset": offset,
        "total": total,
        "SeasonTable": seasonTable?.toJson(),
      };
}
