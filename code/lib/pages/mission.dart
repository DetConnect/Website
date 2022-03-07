import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:detconnect/widgets/link_card.dart';
import 'package:detconnect/widgets/text_card.dart';
import 'package:detconnect/widgets/connected_map.dart';

class Mission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              TextCard(
                  title: "DEMO PRODUCT",
                  text:
                      "Work in progress, we will not be responding to anything yet, the product is not complete."),
              Padding(
                padding: const EdgeInsets.all(15),
              ),
              TextCard(
                  title: "What is DetConnect?",
                  text:
                      "DetConnect is the premier toolset to enable cadet communication between Air Force ROTC detachments"),
              Padding(
                padding: const EdgeInsets.all(15),
              ),
              TextCard(
                title: "Why join DetConnect?",
                text: "• To help organize joint events between detachments\n"
                    "• To connect graduating AS400s with others in their AFSCs\n"
                    "• To share GLPs, Org Charts, etc. to bring creative new ideas into our detachments\n"
                    "• To increase camaraderie and interconnectivity between detachments",
              ),
              Padding(
                padding: const EdgeInsets.all(15),
              ),
              ConnectedMap(),
              Padding(
                padding: const EdgeInsets.all(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinkCard(
                      title: "Interested in joining?",
                      text: "Contact us for an invite to the platform!",
                      page: 1),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
              ),
              TextCard(
                  title: "Already a member?",
                  text:
                      "Click the links in the navigation bar for quick access to the platform"),
            ],
          ),
        ),
      ),
      // Background
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.black, Colors.blueGrey[900], Colors.black],
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          repeat: ImageRepeat.noRepeat,
          image: ExactAssetImage("images/bluebackground.jpg"),
        ),
      ),
    );
  }
}
