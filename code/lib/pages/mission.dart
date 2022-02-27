import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:code/widgets/link_card.dart';
import 'package:code/widgets/internal_link.dart';
import 'package:code/widgets/text_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextCard(
                title: "What is DetConnect?",
                text:
                    "DetConnect is the premier toolset to enable cadet communication between Air Force ROTC detachments\n\n"
                    "It currently consists of a Slack Workspace and a Shared Google Drive",
              ),
              Padding(
                padding: const EdgeInsets.all(15),
              ),
              TextCard(
                title: "Why join DetConnect?",
                text:
                    "• To help organize joint events between detachments such as a joint virtual career day\n"
                    "• To connect graduating AS400s with others in their AFSCs\n"
                    "• To share GLPs, Org Charts, etc. to bring new creative new ideas into our detachments",
              ),
              Padding(
                padding: const EdgeInsets.all(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinkCard(
                      title: "Interested in joining?",
                      text: "Contact us for an invite!",
                      page: 1),
                  LinkCard(title: "?", text: "Check out our team!", page: 2),
                ],
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
              image: ExactAssetImage("images/fighterbackground.jpg"),
            ),
          ),
        ));
  }
}
