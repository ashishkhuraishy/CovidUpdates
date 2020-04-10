import 'package:covid_updates/Models/reportModel.dart';
import 'package:covid_updates/Services/GeoJson.dart';
import 'package:covid_updates/Services/reports.dart';
import 'package:covid_updates/Widgets/chart.dart';
import 'package:covid_updates/Widgets/details.dart';
import 'package:covid_updates/Widgets/lineChart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryReportPage extends StatefulWidget {
  @override
  _CountryReportPageState createState() => _CountryReportPageState();
}

class _CountryReportPageState extends State<CountryReportPage> {
  Map data = {};
  Report _report;
  CountryReport _countryReport;
  CountryHistory _countryHistory;
  LatLng centerValue = new LatLng(0, 0);
  GoogleMapController mapController;
  var filteredCountry = "india";
  List currentCountryDetails = ["IN", "India", 79.6119761, 22.88578212];
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void didChangeDependencies() {
    data = ModalRoute.of(context).settings.arguments;
    _countryReport = data['countryReports'];
    _setReport();
    _fetchHistory();
    currentCountryDetails = GeoJson.countryCenterDetails.firstWhere(
      (currentRecord) => currentRecord[1]
          .toString()
          .toLowerCase()
          .trim()
          .startsWith(filteredCountry),
    );
    centerValue = LatLng(currentCountryDetails[3], currentCountryDetails[2]);
    super.didChangeDependencies();
  }

  void _setReport() {
    setState(() {
      _report = new Report(
        deaths: _countryReport.deaths,
        confirmed: _countryReport.confirmed,
        recovered: _countryReport.recovered,
        totalCases: _countryReport.totalCases,
      );
      filteredCountry = _countryReport.countryName.toLowerCase().trim();
    });
  }

  void _fetchHistory() async {
    CountryHistory temp =
        await getCountryHistoryReport(_countryReport.countryName);
    if (!mounted) {
      return;
    }
    setState(() {
      _countryHistory = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${_countryReport.countryName} Reports',
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
                      Details(
                          report: _report,
                          todayAffeced: _countryReport.todayCases,
                          todayDeaths: _countryReport.todayDeaths),
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: mapState(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: Image(
                image: new AssetImage("assets/images/loader.gif"),
                height: 100,
                width: 100,
              ),
            ),
    );
  }

  mapState() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: centerValue, zoom: 3.0),
      scrollGesturesEnabled: false,
      zoomGesturesEnabled: false,
      myLocationButtonEnabled: false,
      mapToolbarEnabled: false,
      gestureRecognizers: Set()
        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
      //markers: markers,
    );
  }
}
