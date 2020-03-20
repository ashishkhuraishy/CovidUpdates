import 'package:covid_updates/Models/reportModel.dart';
import 'package:covid_updates/Services/reports.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Report _report;

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Covid Updates',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _report != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: width,
                    height: width / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'TOTAL CASES',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text('${_report.totalCases}',
                            style: TextStyle(fontSize: 46.0)),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      child: Container(
                        width: width / 2.5,
                        height: width / 5,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Deaths',
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text('${_report.deaths}')
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: width / 2.5,
                        height: width / 5,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Recovered',
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text('${_report.recovered}')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${_report.updatedTime}',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
