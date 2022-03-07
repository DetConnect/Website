import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TimeOnline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: daysOnline().toString() + " ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[200],
                        fontFamily: 'Roboto',
                        fontSize: 35),
                  ),
                ]),
          ),
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: daysOnline() == 1 ? "Day\nOnline" : "Days\nOnline",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[200],
                        fontFamily: 'Roboto',
                        fontSize: 15),
                  ),
                ]),
          ),
        ],
      ),
      // Background
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blue[900],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  int daysOnline() {
    final online = DateTime.utc(2022, 3, 7);
    final difference = DateTime.now().difference(online);
    return (difference.inDays);
  }
}
