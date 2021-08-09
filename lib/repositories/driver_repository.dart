import 'dart:convert';
import 'package:pitstop/models/driver_table.dart';
import 'package:pitstop/models/mrdata.dart';
import 'package:http/http.dart' as http;
import 'package:pitstop/models/standings.dart';

abstract class DriverRepository {
  Future<List<Driver>> getDriversForSelectedYear(String year);
  Future<List<DriverStanding>> getDriverStandingForYear(String year);
}

class DriverRepositoryImpl implements DriverRepository {
  final String _driverURl =
      "http://ergast.com/api/f1/{year}/drivers.json?limit=30";
  final String _standingUrl =
      "http://ergast.com/api/f1/{year}/driverStandings.json";

  DriverRepositoryImpl();

  Future<List<Driver>> getDriversForSelectedYear(String year) async {
    try {
      final response =
          await http.get(Uri.parse(this._driverURl.replaceAll("{year}", year)));
      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);
        BaseModel data = new BaseModel.fromJson(parsedResponse);
        if (data.mrData.driverTable != null) {
          return data.mrData.driverTable!.drivers;
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

  Future<List<DriverStanding>> getDriverStandingForYear(String year) async {
    try {
      final response = await http
          .get(Uri.parse(this._standingUrl.replaceAll("{year}", year)));
      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body);
        BaseModel data = new BaseModel.fromJson(parsedResponse);
        if (data.mrData.standingsTable != null &&
            data.mrData.standingsTable!.standingsLists[0].driverStandings !=
                null) {
          return data.mrData.standingsTable!.standingsLists[0].driverStandings!;
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
