import 'dart:convert';

import 'package:pitstop/models/mrdata.dart';
import 'package:pitstop/models/race_table.dart';
import 'package:http/http.dart' as http;

abstract class RaceRepository {
  Future<List<Race>> getRacesForYear(String year);
}

class RaceRepositoryImpl implements RaceRepository {
  final String _raceURL = "http://ergast.com/api/f1/{year}.json?limit=30";

  Future<List<Race>> getRacesForYear(String year) async {
    try {
      final response =
          await http.get(Uri.parse(this._raceURL.replaceAll("{year}", year)));
      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);
        BaseModel data = new BaseModel.fromJson(parsedResponse);
        if (data.mrData.raceTable != null) {
          return data.mrData.raceTable!.races;
        } else {
          return [];
        }
      } else {
        throw Error();
      }
    } catch (error) {
      throw error.toString();
    }
  }
}
