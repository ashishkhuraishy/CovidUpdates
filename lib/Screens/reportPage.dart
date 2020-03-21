import 'package:covid_updates/Models/reportModel.dart';
import 'package:covid_updates/Services/reports.dart';
import 'package:covid_updates/Widgets/chart.dart';
import 'package:covid_updates/Widgets/details.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  Report _report;
  int fallback = 0;
  String dateT = "", timeT = '';

  @override
  void initState() {
    super.initState();
    initialise();
  }

  void initialise() async {
    Report _temp = await getReport();

    setState(() {
      _report = _temp;
      dateT = _report.updatedDate;
      timeT = _report.updatedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reports',
          style: Theme.of(context).textTheme.title,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        textTheme: Theme.of(context).textTheme,
        iconTheme: IconThemeData(color: Colors.black),
        titleSpacing: 1,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$dateT',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                Expanded(
                  child: Text(
                    '$timeT',
                    style: Theme.of(context).textTheme.caption,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: _report != null
          ? SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[],
                        ),
                      ),
                      PieChartSample2(_report),
                      Details(_report),
                      Container(
                        child: Image.asset('assets/images/covidmap.png'),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
