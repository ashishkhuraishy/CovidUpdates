import 'package:covid_updates/Screens/homePage.dart';
import 'package:covid_updates/Screens/reportPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Updates',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
         '/': (context) => HomePage(),
         '/reports': (context) => ReportPage()
      },
    );
  }
}

