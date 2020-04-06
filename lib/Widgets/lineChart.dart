import 'package:covid_updates/Models/reportModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class HistoricalChart extends StatefulWidget {
  final CountryHistory history;

  HistoricalChart({@required this.history});

  @override
  State<StatefulWidget> createState() => HistoricalChartState(history: history);
}

class ChartDisplayDataSet {
  Map<DateTime, int> data;
  Color color;
  String title;

  ChartDisplayDataSet(this.data, this.color, this.title);
}

class HistoricalChartState extends State<HistoricalChart> {
  CountryHistory history;

  List<ChartDisplayDataSet> dataSets = List();

  HistoricalChartState({@required this.history});

  @override
  void initState() {
    super.initState();

    dataSets.add(ChartDisplayDataSet(history.cases, Colors.blue[400], "Recovered"));
    dataSets.add(ChartDisplayDataSet(history.deaths, Colors.red, "Deaths"));
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Historical Data',
                  style: Theme.of(context).primaryTextTheme.title.copyWith(
                        color: Colors.black,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                    child: LineChart(
                      historyData(),
                      swapAnimationDuration: Duration(milliseconds: 250),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int startIndex() {
    return max(history.cases.values.length - 20, 0);
  }

  LineChartData historyData() {
    int maxCases = history.cases.values.reduce(max);
    int rounded = ((maxCases + 999) ~/ 1000) * 1000;
    double verticalInterval = (rounded.toDouble() / 5.0);
    double horizontalInterval = 3.0;
    return LineChartData(
      minY: 0,
      maxY: rounded.toDouble(),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.grey.withOpacity(0.1),
          getTooltipItems: (spots) {
            return spots
                .asMap()
                .map((index, spot) {
                  return MapEntry(
                      index,
                      LineTooltipItem(
                          "${dataSets[index].title} - ${spot.y.toInt()}",
                          Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: Colors.black)));
                })
                .values
                .toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: SideTitles(
          showTitles: true,
          interval: verticalInterval,
          getTitles: (value) {
            return "${NumberFormat.compact().format(value.toInt())}";
          },
        ),
        bottomTitles: SideTitles(
          interval: horizontalInterval,
          showTitles: true,
          getTitles: (value) {
            DateTime date =
                history.cases.keys.toList()[startIndex() + value.toInt()];
            return DateFormat("MMM d").format(date);
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        verticalInterval: horizontalInterval,
        horizontalInterval: verticalInterval,
      ),
      borderData: FlBorderData(
        show: false,
        border: Border(
          bottom: BorderSide(
            color: const Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      lineBarsData:
          dataSets.map((set) => _fromData(set.data, set.color)).toList(),
    );
  }

  LineChartBarData _fromData(Map<DateTime, int> data, Color color) {
    var listData = List<FlSpot>();
    data.values.toList().sublist(startIndex()).asMap().forEach((index, value) {
      listData.add(FlSpot(index.toDouble(), value.toDouble()));
    });
    if (listData.isEmpty) {
      listData.add(FlSpot(0.0, 0.0));
    }
    return LineChartBarData(
      spots: listData,
      isCurved: true,
      colors: [
        color,
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
    );
  }
}
