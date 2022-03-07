import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:detconnect/extensions/hover_extension.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConnectWorkspace extends StatelessWidget {
  final String name;
  final Icon icon;
  final String about;
  final int rowOffset;
  final int rowSize;

  const ConnectWorkspace({
    this.name = "Slack",
    this.icon = const Icon(
      FontAwesomeIcons.slack,
      size: 20,
      color: Colors.black,
    ),
    this.about =
        "Slack workspace to connect with cadets from around the nation",
    this.rowOffset = 1,
    this.rowSize = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Name
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: this.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 30),
                  ),
                ]),
          ),
          // Images
          this.icon,
          // About
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: this.about,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
        gradient: new LinearGradient(
          colors: [
            getOffsetColor(this.rowOffset, 0),
            getOffsetColor(this.rowOffset, 100),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    ).scaleUpOnHover;
  }

  Color getOffsetColor(int rowOffset, int colorOffset) {
    int colorIntensity = (rowOffset % this.rowSize + 1) * 100 + colorOffset;
    return Colors.blue[colorIntensity];
  }
}
