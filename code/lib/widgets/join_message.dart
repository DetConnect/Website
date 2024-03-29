import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:detconnect/extensions/hover_extension.dart';
import 'package:detconnect/widgets/text_card.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class JoinMessage extends StatefulWidget {
  final BuildContext buildContext;

  // You can also pass the translation in here if you want to
  JoinMessage({Key key, this.buildContext}) : super(key: key);
  @override
  _JoinMessageState createState() => _JoinMessageState(this.buildContext);
}

class _JoinMessageState extends State<JoinMessage> {
  //TextEditingController _textEditingController = new TextEditingController();

  String name;
  String rank;
  String position;
  String detachment;
  String email;

  Widget _myAnimatedWidget;
  double _errorOpacity = 0;
  String _errorMessage = "";

  _JoinMessageState(BuildContext buildContext) {
    _myAnimatedWidget = Row(
      children: [
        Padding(
          padding: EdgeInsets.all(getPaddingSize(buildContext)),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextCard(
                title: "Join Us!",
                text: "Fill out your details below and hit submit!"),
            Padding(
              padding: const EdgeInsets.all(15),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                labelText: 'Full Name',
                hintText: 'John Smith',
                fillColor: Colors.white,
                filled: true,
              ),
              style: TextStyle(
                color: Colors.blue[900],
                decorationColor: Colors.white,
              ),
              onChanged: (String value) {
                this.name = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.medal,
                  color: Colors.white,
                ),
                labelText: 'Rank',
                hintText: 'C/Lt Col',
                fillColor: Colors.white,
                filled: true,
              ),
              style: TextStyle(
                color: Colors.blue[900],
                decorationColor: Colors.white,
              ),
              onChanged: (String value) {
                this.rank = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                ),
                labelText: 'Position',
                hintText: 'Joint Liason Officer',
                fillColor: Colors.white,
                filled: true,
              ),
              style: TextStyle(
                color: Colors.blue[900],
                decorationColor: Colors.white,
              ),
              onChanged: (String value) {
                this.position = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.building,
                  color: Colors.white,
                ),
                labelText: 'Detachment',
                hintText: 'Det 538',
                fillColor: Colors.white,
                filled: true,
              ),
              style: TextStyle(
                color: Colors.blue[900],
                decorationColor: Colors.white,
              ),
              onChanged: (String value) {
                this.detachment = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                labelText: 'Email',
                hintText: 'yourname@college.edu',
                fillColor: Colors.white,
                filled: true,
              ),
              style: TextStyle(
                color: Colors.blue[900],
                decorationColor: Colors.white,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (String value) {
                this.email = value;
              },
              validator: (String value) {
                return (value != null && value.contains("@")) &&
                        value.contains(".")
                    ? null
                    : 'Invalid email address';
              },
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: const Icon(
                  Icons.play_arrow,
                  size: 100,
                  color: Colors.white,
                ),
                onTap: () {
                  if (this.name == null ||
                      this.rank == null ||
                      this.position == null ||
                      this.detachment == null ||
                      this.email == null) {
                    // for not filled out
                    setState(() {
                      this._errorOpacity = 1;
                      this._errorMessage = "Please fill out all fields!";
                    });
                  } else {
                    var response = sendRequest();
                    setState(() {
                      this._errorOpacity = 0;
                      this._myAnimatedWidget = Column(children: [
                        Container(
                          padding: EdgeInsets.all(50),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: ExactAssetImage("images/satellite.gif")),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(200),
                        )
                      ]);
                    });
                    response.then((value) {
                      if (value.statusCode == 200 &&
                          value.body.toString() == "\"Success\"") {
                        // response is good
                        setState(() {
                          this._errorOpacity = 0;
                          this._myAnimatedWidget = Padding(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextCard(
                                        title: "Thank you!",
                                        text:
                                            "Your entry has been submitted, we will be in touch shortly!"),
                                    Padding(
                                      padding: const EdgeInsets.all(200),
                                    ),
                                  ]));
                        });
                      } else {
                        // response is bad
                        setState(() {
                          this._errorOpacity = 1;
                          this._errorMessage =
                              "Error: connection to server failed, please check your internet connection and try again! " +
                                  value.statusCode.toString();
                        });
                      }
                    });
                  }
                },
              ),
            ).showCursorOnHover.moveUpOnHover,
          ],
        )),
        Padding(
          padding: EdgeInsets.all(getPaddingSize(buildContext)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AnimatedSwitcher(
          duration: Duration(seconds: 1), child: _myAnimatedWidget),
      AnimatedOpacity(
          child: Padding(
            padding: EdgeInsets.all(0),
            child: RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: this._errorMessage,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontFamily: 'Roboto',
                          fontSize: 30),
                    ),
                  ]),
            ),
          ),
          opacity: this._errorOpacity,
          duration: const Duration(milliseconds: 500)),
    ]);
  }

  // Used to dynamically size the grid
  double getPaddingSize(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    if (screenSize < 800) {
      return 0;
    } else if (screenSize < 1400) {
      return 100;
    }
    return 200;
  }

  Future<http.Response> sendRequest() async {
    var url = Uri.parse(
        "https://script.google.com/macros/s/AKfycbyd4tS7sL91cIz-If9880lDWcHXCKYvY5AKfHqqn0lqwFZaz_oLX3Q8E1TpLAUHOeqiog/exec");
    return await http.post(url,
        headers: {
          "Content-Type": "text/plain",
        },
        body: jsonEncode({
          "name": this.name,
          "rank": this.rank,
          "position": this.position,
          "detachment": this.detachment,
          "email": this.email,
        }));
  }
}
