import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNavItems extends StatefulWidget {
  @override
  _HomeNavItemsState createState() => _HomeNavItemsState();
}

class _HomeNavItemsState extends State<HomeNavItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            getHomePageNavItems(
                context: context,
                icon: Icons.mood_bad,
                title: 'Symptoms',
                subTitle: 'Signs to Identify the risk of Infection',
                navigate: 'symptoms'),
            SizedBox(
              width: 16.0,
            ),
            getHomePageNavItems(
                context: context,
                icon: FontAwesomeIcons.solidHospital,
                title: 'Prevention',
                subTitle: 'Help you to avoid getting infected',
                navigate: 'prevention'
                ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            getHomePageNavItems(
                context: context,
                icon: Icons.insert_chart,
                title: 'Reports',
                subTitle: 'Data and info related to the disease',
                navigate: 'reports'
                ),
            SizedBox(
              width: 16.0,
            ),
            getHomePageNavItems(
                context: context,
                icon: FontAwesomeIcons.globeAmericas,
                title: 'Countries',
                subTitle: 'Countries infected by COVID-19',
                navigate: 'countries'),
          ],
        ),
        SizedBox(
          height: 24.0,
        )
      ],
    );
  }
}

Widget getHomePageNavItems(
    {BuildContext context, IconData icon, String title, String subTitle, String navigate}) {
  return Expanded(
    child: InkWell(
      onTap: (){
        navigate != null ? Navigator.pushNamed(context, '/$navigate') : print("No where to go") ;
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Color(0xFF1A35E4),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              size: 32.0,
              color: Colors.amber,
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 10.0),
            ),
          ],
        ),
      ),
    ),
  );
}
