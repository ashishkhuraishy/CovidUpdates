import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final double percentage;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.percentage = 15,
    this.size = 8,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 3),
          width: 22,
          height: size,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ),
        const SizedBox(
          width: 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              '${percentage.toStringAsFixed(2)}%',
              style: Theme.of(context).textTheme.subhead.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        )
      ],
    );
  }
}
