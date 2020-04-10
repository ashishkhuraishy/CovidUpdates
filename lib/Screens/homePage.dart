import 'package:covid_updates/Widgets/homeNavItems.dart';
import 'package:covid_updates/Widgets/requirements.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prevent COVID - 19",
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Color.fromRGBO(0, 0, 200, 1),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Color.fromRGBO(0, 0, 200, 1),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width,
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            HomeNavItems(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Requirements",
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Help you to prevent viruses better",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                          ],
                        ),
                      ),
                      Requirements(),
                      Container(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'News',
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 24.0,
                            ),
                            Center(
                              child:
                                  Image.asset('assets/images/coming_soon.png'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
