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
      appBar: AppBar(
        title: Text(
          'Reports',
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
                      _report.updatedDate != null ? Text(
                        'Last Updated - ${_report.updatedDate} ${_report.updatedTime}',
                        style: Theme.of(context).textTheme.overline,
                      ) : SizedBox(),
                      SizedBox(
                        height: 16.0,
                      ),
                      Details(report: _report),
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
