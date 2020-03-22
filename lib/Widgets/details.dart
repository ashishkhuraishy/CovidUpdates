import 'package:covid_updates/Models/reportModel.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Report report;
  int todayAffeced, todayDeaths;
  Details({this.report, this.todayAffeced, this.todayDeaths});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                createDetailItem(context: context, color: Colors.blue[400], value: report.recovered, text: "Recovered"),
                createDetailItem(context: context, color: Colors.blue[900], value: report.confirmed, text: "Affected", todaysUpdate: todayAffeced),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                createDetailItem( context: context, color: Colors.red, value: report.deaths, text: "Deaths", todaysUpdate: todayDeaths),
                createDetailItem(context: context,value: report.totalCases, text: "Total Cases"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget createDetailItem({BuildContext context, int value, Color color , String text, int todaysUpdate}) {
  return Expanded(
      child: Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              color != null ? Container(
                margin: EdgeInsets.only(right: 8.0),
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: color ?? Colors.transparent,
                  borderRadius: BorderRadius.circular(2.0)
                ),
              ) : SizedBox(),
              Text(
                '$text',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: <Widget>[
              Text(
                '$value',
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal :8.0),
                child: todaysUpdate != null ? Text('(+$todaysUpdate)', style: Theme.of(context).textTheme.caption,): Text(''),
              )
            ],
          )
        ],
      ),
    ),
  );
}
