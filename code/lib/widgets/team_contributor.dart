import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:code/widgets/link.dart';
import 'package:code/extensions/hover_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamContributor extends StatelessWidget {
  final String name;
  final String imagePath;
  final String about;
  final int rowOffset;
  final int rowSize;

  const TeamContributor({
    this.name = "Brendan Kapp",
    this.imagePath = "images/bek.jpg",
    this.about = "Chief Architech and Main Contributor.",
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(this.imagePath)),
                ),
              ),
            ),
          ),
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
          Row(
            children: [
              Link(
                link: "https://github.com/BrendanKapp",
                icon: const Icon(
                  FontAwesomeIcons.github,
                  size: 20,
                  color: Colors.blueGrey,
                ),
              ),
              Link(
                  link: "https://www.linkedin.com/in/brendan-kapp/",
                  icon: const Icon(
                    FontAwesomeIcons.linkedin,
                    size: 20,
                    color: Colors.blueGrey,
                  ))
            ],
          )
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
