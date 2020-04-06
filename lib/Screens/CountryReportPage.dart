import 'package:covid_updates/Models/reportModel.dart';
import 'package:covid_updates/Services/reports.dart';
import 'package:covid_updates/Widgets/chart.dart';
import 'package:covid_updates/Widgets/details.dart';
import 'package:covid_updates/Widgets/lineChart.dart';
import 'package:flutter/material.dart';

class CountryReportPage extends StatefulWidget {
  @override
  _CountryReportPageState createState() => _CountryReportPageState();
}

class _CountryReportPageState extends State<CountryReportPage> {

  Map data = {};
  Report _report;
  CountryReport _countryReport;
  CountryHistory _countryHistory;

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context).settings.arguments;
    _countryReport = data['countryReports'];
    _setReport();
    _fetchHistory();
    super.didChangeDependencies();
  }

  void _setReport(){
    setState(() {
      _report = new Report(
        deaths: _countryReport.deaths,
        confirmed: _countryReport.confirmed,
        recovered: _countryReport.recovered,
        totalCases: _countryReport.totalCases,
      );
  
    });
  }

  void _fetchHistory() async {
    CountryHistory temp = await getCountryHistoryReport(_countryReport.countryName);
    if (!mounted) { return; }
    setState(() {
      _countryHistory = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_countryReport.countryName}',
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: _report != null && _countryHistory != null
          ? SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      PieChartSample2(_report),
                      HistoricalChart(history: _countryHistory),
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