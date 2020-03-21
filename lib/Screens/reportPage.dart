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

  @override
  void initState() {
    super.initState();
    initialise();
  }

  void initialise() async {
    Report _temp = await getReport();

    setState(() {
      _report = _temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _report != null
          ? SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Reports',
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              '${_report.updatedTime}',
                              style: Theme.of(context).textTheme.subtitle,
                            )
                          ],
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
