import 'dart:convert';
import 'package:pitstop/models/mrdata.dart';
import 'package:pitstop/models/season_table.dart';
import 'package:http/http.dart' as http;

abstract class SeasonRepository {
  Future<List<Season>> getAllSeasons();
}

class SeasonRepositoryImpl extends SeasonRepository {
  final String _baseURl = 'http://ergast.com/api/f1/seasons.json?limit=72';

  SeasonRepositoryImpl();

  @override
  Future<List<Season>> getAllSeasons() async {
    try {
      final response = await http.get(Uri.parse(this._baseURl));
      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);
        BaseModel data = new BaseModel.fromJson(parsedResponse);
        if (data.mrData.seasonTable != null) {
          return data.mrData.seasonTable!.seasons.reversed.toList();
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
