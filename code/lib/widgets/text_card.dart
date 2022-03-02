import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:code/widgets/link.dart';
import 'package:code/extensions/hover_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                        color: Colors.grey[200],
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
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[200],
                        height: 2.0,
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
}
