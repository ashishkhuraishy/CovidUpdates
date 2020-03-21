import 'package:flutter/material.dart';

class SymptomsItems extends StatefulWidget {
  @override
  _SymptomsItemsState createState() => _SymptomsItemsState();
}

class _SymptomsItemsState extends State<SymptomsItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        getSymptomsItems(context, 'Fever'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Cough'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Tiredness'),
        SizedBox(height: 16.0,),
        getSymptomsItems(context, 'Difficulty Breathing'),
        SizedBox(height: 16.0,),
        
      ],
    );
  }
}

Widget getSymptomsItems(BuildContext context, String text) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xFF1A35E4),
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    child: ListTile(
      leading: Icon(
        Icons.error,
        color: Colors.amber,
      ),
      title: Text(
        text,
        style:
            Theme.of(context).textTheme.subhead.copyWith(color: Colors.white),
      ),
      trailing: Icon(
        Icons.chrome_reader_mode,
        color: Colors.white,
      ),
    ),
  );
}
