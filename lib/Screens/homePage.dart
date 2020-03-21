import 'package:covid_updates/Widgets/homeNavItems.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Color(0xFF0321EC),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: width,
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        'Prevent COVID - 19 ',
                        style: Theme.of(context).textTheme.title.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w100),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      HomeNavItems(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
