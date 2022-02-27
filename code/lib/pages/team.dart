import 'package:code/widgets/team_contributor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:code/widgets/team_contributor.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rowSize = getCrossAxisCount(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: rowSize,
        children: <Widget>[
          TeamContributor(
            name: "Brendan Kapp",
            about: "Chief Architech and Main Contributor",
            imagePath: "/images/bek.jpg",
            rowOffset: 0,
            rowSize: rowSize,
          ),
          TeamContributor(
            name: "Join us!",
            about: "Application submission coming soon!",
            imagePath: "/images/unknown.jpeg",
            rowOffset: 1,
            rowSize: rowSize,
          ),
        ],
      ),
      // Background
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.black, Colors.blueGrey[900], Colors.black],
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          repeat: ImageRepeat.repeat,
          image: ExactAssetImage("images/binarybackground2.png"),
        ),
      ),
    );
  }

  // Used to dynamically size the grid
  int getCrossAxisCount(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    if (screenSize < 900) {
      return 1;
    } else if (screenSize < 1400) {
      return 2;
    } else {
      return 3;
    }
  }
}
