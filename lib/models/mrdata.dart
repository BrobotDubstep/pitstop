import 'dart:convert';
import 'package:pitstop/models/constructor_table.dart';
import 'package:pitstop/models/driver_table.dart';
import 'package:pitstop/models/standings.dart';

import 'season_table.dart';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

class BaseModel {
  BaseModel({
    required this.mrData,
  });

  MrData mrData;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        mrData: MrData.fromJson(json["MRData"]),
      );
}

class MrData {
  MrData(
      {required this.xmlns,
      required this.series,
      required this.url,
      required this.limit,
      required this.offset,
      required this.total,
      this.seasonTable,
      this.driverTable,
      this.constructorTable,
      this.standingsTable});

  String xmlns;
  String series;
  String url;
  String limit;
  String offset;
  String total;
  SeasonTable? seasonTable;
  DriverTable? driverTable;
  ConstructorTable? constructorTable;
  StandingsTable? standingsTable;

  factory MrData.fromJson(Map<String, dynamic> json) => MrData(
      xmlns: json["xmlns"],
      series: json["series"],
      url: json["url"],
      limit: json["limit"],
      offset: json["offset"],
      total: json["total"],
      seasonTable: json["SeasonTable"] != null
          ? SeasonTable?.fromJson(json["SeasonTable"])
          : null,
      driverTable: json["DriverTable"] != null
          ? DriverTable.fromJson(json["DriverTable"])
          : null,
      constructorTable: json['ConstructorTable'] != null
          ? ConstructorTable.fromJson(json["ConstructorTable"])
          : null,
      standingsTable: json['StandingsTable'] != null
          ? StandingsTable.fromJson(json["StandingsTable"])
          : null);
}
