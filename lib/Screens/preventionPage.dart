import 'package:covid_updates/Widgets/symptomsItems.dart';
import 'package:flutter/material.dart';

class PreventioPage extends StatefulWidget {
  @override
  _PreventioPageState createState() => _PreventioPageState();
}

class _PreventioPageState extends State<PreventioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prevention",
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              color: Color(0xFF1E3CFF),
              child: PreventionItems(),
            ),
            Image.asset('assets/images/doctor1.jpg'),
            Container(
              padding: EdgeInsets.all(24.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              "Stay aware of the latest information on the COVID-19 outbreak, available on the WHO website and through your national and local public health authority. Many countries around the world have seen cases of COVID-19 and several have seen outbreaks. Authorities in China and some other countries have succeeded in slowing or stopping their outbreaks. However, the situation is unpredictable so check regularly for the latest news.",
                          style: Theme.of(context).textTheme.subhead,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 28.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF1E3CFF),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: FlatButton.icon(
                        onPressed: () {
                          launchUrl();
                        },
                        icon: Icon(Icons.open_in_new, color: Colors.white),
                        label: Text(
                          "Read More",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 32.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
