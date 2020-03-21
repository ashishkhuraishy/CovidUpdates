import 'package:covid_updates/Widgets/symptomsItems.dart';
import 'package:flutter/material.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Symptoms",
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
              child: SymptomsItems(),
            ),
            Image.asset('assets/images/symptomMain.jpg'),
            Container(
              padding: EdgeInsets.all(24.0),
              color: Colors.white,
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "People may be sick with the virus for 1 to 14 days before developing symptoms. The most common symptoms of coronavirus disease (COVID-19) are fever, tiredness, and dry cough. Most people (about 80%) recover from the disease without needing special treatment.",
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 16.0),
                    ),
                    TextSpan(
                        text:
                            "\nMore rarely, the disease can be serious and even fatal. Older people, and people with other medical conditions (such as asthma, diabetes, or heart disease), may be more vulnerable to becoming severely ill.",
                        style: Theme.of(context).textTheme.subhead)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
