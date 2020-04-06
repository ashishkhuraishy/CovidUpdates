import 'dart:convert';

import 'package:covid_updates/Models/reportModel.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

final String link = "https://corona.lmao.ninja/";

Future<Report> getReport() async {
  Report report;
  DateFormat formatter = DateFormat("MMM d y");
  DateFormat timeFormatter = DateFormat().add_jm();

  try {
    Response response = await get(link + "all");
    Map data = jsonDecode(response.body);
    report = new Report(
      deaths: data["deaths"],
      recovered: data["recovered"],
      totalCases: data["cases"],
      confirmed: data['cases'] - (data['deaths'] + data['recovered']),
      updatedDate: formatter
          .format(DateTime.fromMillisecondsSinceEpoch(data['updated'])),
      updatedTime: timeFormatter
          .format(DateTime.fromMillisecondsSinceEpoch(data['updated'])),
    );
    print(data);
  } catch (e) {
    print("Exception Caught at getReport() $e");
  }

  return report;
}

Future<List<CountryReport>> getAllCountriesReport() async {
  List<CountryReport> reports = [];

  try {
    Response response = await get(link + "countries");
    List data = jsonDecode(response.body);
    for (int i = 0; i < data.length; i++) {
      CountryReport _report = new CountryReport(
          deaths: data[i]["deaths"],
          recovered: data[i]["recovered"],
          totalCases: data[i]["cases"],
          confirmed:
              data[i]['cases'] - (data[i]['deaths'] + data[i]['recovered']),
          todayCases: data[i]['todayCases'],
          todayDeaths: data[i]['todayDeaths'],
          countryName: data[i]['country']);
      reports.add(_report);
    }

    print(data.length);
  } catch (e) {
    print("Exception Caught at getCountriesReport() $e");
  }

  return reports;
}

Future<CountryHistory> getCountryHistoryReport(String countryName) async {
  try {
    Response response = await get(link + "v2/historical/" + countryName);
    dynamic data = jsonDecode(response.body);

    Map<String, dynamic> cases = data["timeline"]["recovered"];
    Map<String, dynamic> deaths = data["timeline"]["deaths"];

    return new CountryHistory(
      cases: cases.map(_mapHistoryRecord),
      deaths: deaths.map(_mapHistoryRecord),
    );
  } catch (e) {
    return new CountryHistory(cases: {}, deaths: {},);
  }
}

final DateFormat format = new DateFormat("MM/dd/yy");

MapEntry<DateTime, int> _mapHistoryRecord(String dateString, dynamic count) {
  return MapEntry<DateTime, int>(format.parse(dateString), count.toInt());
}
