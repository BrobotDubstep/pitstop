import 'dart:convert';
import 'package:pitstop/models/constructor_table.dart';
import 'package:pitstop/models/mrdata.dart';
import 'package:http/http.dart' as http;
import 'package:pitstop/models/standings.dart';

abstract class ConstructorRepository {
  Future<List<Constructor>> getConstructorsForSelectedYear(String year);
  Future<List<ConstructorStanding>> getConstructorStandingForYear(String year);
}

class ConstructorRepositoryImpl implements ConstructorRepository {
  final String _driverURl =
      "http://ergast.com/api/f1/{year}/constructors.json?limit=30";
  final String _standingUrl =
      "http://ergast.com/api/f1/{year}/constructorStandings.json";

  ConstructorRepositoryImpl();

  Future<List<Constructor>> getConstructorsForSelectedYear(String year) async {
    try {
      final response =
          await http.get(Uri.parse(this._driverURl.replaceAll("{year}", year)));
      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);
        BaseModel data = new BaseModel.fromJson(parsedResponse);
        if (data.mrData.constructorTable != null) {
          return data.mrData.constructorTable!.constructors;
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

  Future<List<ConstructorStanding>> getConstructorStandingForYear(
      String year) async {
    try {
      final response = await http
          .get(Uri.parse(this._standingUrl.replaceAll("{year}", year)));
      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);
        BaseModel data = new BaseModel.fromJson(parsedResponse);
        if (data.mrData.standingsTable != null &&
            data.mrData.standingsTable!.standingsLists[0]
                    .constructorStandings !=
                null) {
          return data
              .mrData.standingsTable!.standingsLists[0].constructorStandings!;
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
