import 'package:covid_updates/Models/reportModel.dart';
import 'package:covid_updates/Widgets/chart.dart';
import 'package:covid_updates/Widgets/details.dart';
import 'package:flutter/material.dart';

class CountryReportPage extends StatefulWidget {
  @override
  _CountryReportPageState createState() => _CountryReportPageState();
}

class _CountryReportPageState extends State<CountryReportPage> {

  Map data = {};
  Report _report;
  CountryReport _countryReport;

  void setReport(){
    setState(() {
      _report = new Report(
        deaths: _countryReport.deaths,
        confirmed: _countryReport.confirmed,
        recovered: _countryReport.recovered,
        totalCases: _countryReport.totalCases,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    _countryReport = data['countryReports'];
    setReport();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_countryReport.countryName}',
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: _report != null
          ? SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PieChartSample2(_report),
                      SizedBox(
                        height: 16.0,
                      ),
                      Details(report :_report,todayAffeced : _countryReport.todayCases, todayDeaths : _countryReport.todayDeaths),
                      Container(
                        child: Image.asset('assets/images/covidmap.png'),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}