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
