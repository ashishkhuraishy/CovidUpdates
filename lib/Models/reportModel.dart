import 'dart:core';

class Report {
  int recovered;
  int confirmed;
  int deaths;
  int totalCases;
  String updatedDate;
  String updatedTime;

  Report(
      {this.confirmed,
      this.recovered,
      this.deaths,
      this.totalCases,
      this.updatedDate,
      this.updatedTime});
}

class CountryReport {
  int recovered;
  int todayDeaths;
  int todayCases;
  int confirmed;
  int deaths;
  int totalCases;
  String countryName;

  CountryReport(
      {this.confirmed,
      this.deaths,
      this.recovered,
      this.todayCases,
      this.todayDeaths,
      this.totalCases,
      this.countryName});
}

class CountryHistory {
  Map<DateTime, int> cases;
  Map<DateTime, int> deaths;
  Map<DateTime, int> recovered;
  CountryHistory({this.cases, this.deaths, this.recovered});
}
