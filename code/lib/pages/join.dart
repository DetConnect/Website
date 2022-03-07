import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:detconnect/widgets/join_message.dart';

class Join extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rowSize = getCrossAxisCount(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(200),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: ExactAssetImage("images/IconWhite.png")),
              ),
            ),
            JoinMessage(
              buildContext: context,
            ),
          ],
        ),
      ),
      // Background
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.black, Colors.blueGrey[900], Colors.black],
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          repeat: ImageRepeat.repeat,
          image: ExactAssetImage("images/bluebackground.jpg"),
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
