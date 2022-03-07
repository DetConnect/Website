import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextCard extends StatelessWidget {
  final String title;
  final String text;

  const TextCard({
    this.title = "Title",
    this.text = "Text",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: this.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 30),
                  ),
                ]),
          ),
          // Title
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: this.text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.5,
                        fontFamily: 'Roboto',
                        fontSize: 18),
                  ),
                ]),
          ),
        ],
      ),
      // Background
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.blueAccent[400],
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
}
