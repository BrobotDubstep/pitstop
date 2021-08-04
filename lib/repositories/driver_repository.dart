import 'dart:convert';
import 'package:pitstop/models/driver_table.dart';
import 'package:pitstop/models/mrdata.dart';
import 'package:http/http.dart' as http;

abstract class DriverRepository {
  Future<List<Driver>> getDriversForSelectedYear(String year);
}

class DriverRepositoryImpl implements DriverRepository {
  final String _baseURl =
      "http://ergast.com/api/f1/{year}/drivers.json?limit=30";

  DriverRepositoryImpl();

  @override
  Future<List<Driver>> getDriversForSelectedYear(String year) async {
    try {
      final response =
          await http.get(Uri.parse(this._baseURl.replaceAll("{year}", year)));
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
}
