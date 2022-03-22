import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  late String text;
  late bool isEnd = false;
  Clock({required this.text, required this.isEnd});

  @override
  _ClockState createState() => _ClockState(text: this.text, isEnd: this.isEnd);
}

class _ClockState extends State<Clock> {
  late String text;
  late bool isEnd;
  _ClockState({required this.text, required this.isEnd});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 27,
          height: 27,
          child: Center(child: Text((this.text == null)?"00":this.text, style: TextStyle(color: Colors.white, fontSize: 12))),
          decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(5)),
        ),
        SizedBox(width: 3,),
        (isEnd)? SizedBox(width: 0) : Text(
          ':',
          style: TextStyle(color: Colors.white,),
        ),
        SizedBox(width: 3,),
      ],
    );
  }
}
