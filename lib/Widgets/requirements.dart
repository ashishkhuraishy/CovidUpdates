import 'package:flutter/material.dart';

class Requirements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        getRequirementItems(context: context, text: 'Mask', imgSrc: 'mask', bgColor: Colors.red[100], imgColor: Colors.red[700]),
        getRequirementItems(context: context, text: 'Gloves', imgSrc: 'gloves', bgColor: Colors.amber[100], imgColor: Colors.amber[700]),
        getRequirementItems(context: context, text: 'Alchohol-based hand sanitizer', imgSrc: 'alchohol', bgColor: Colors.blue[100], imgColor: Colors.blue[700]),
        getRequirementItems(context: context, text: 'Soap', imgSrc: 'soap', bgColor: Colors.grey[300], imgColor: Colors.grey[700]),
      ],
    );
  }
}

Widget getRequirementItems({BuildContext context, String text, String imgSrc, Color bgColor, Color imgColor}) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        child: Image(image: AssetImage('assets/images/$imgSrc.png'), height: 32, fit: BoxFit.contain, color: imgColor,),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(text, style: Theme.of(context).textTheme.subtitle,)
    ],
  );
}
