import 'dart:html';
import 'package:code/widgets/text_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:code/extensions/hover_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class JoinMessage extends StatefulWidget {
  // You can also pass the translation in here if you want to
  JoinMessage({Key key}) : super(key: key);
  @override
  _JoinMessageState createState() => _JoinMessageState();
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

  _JoinMessageState() {
    _myAnimatedWidget = Row(
      children: [
        Padding(
          padding: EdgeInsets.all(50),
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
                  FontAwesomeIcons.sitemap,
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
                    response.then((value) {
                      if (value.statusCode == 200) {
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
                              "Error: connection to server failed, please check your internet connection and try again!";
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
          padding: EdgeInsets.all(50),
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
    return (screenSize / 700);
  }

  Future<http.Response> sendRequest() async {
    var url = Uri.parse("https://formsubmit.co/bek7883@rit.edu");
    return await http.post(url, headers: {
      "Accept": "application/json",
    }, body: {
      "application": "dev",
      "name": this.name,
      "rank": this.rank,
      "position": this.position,
      "detachment": this.detachment,
      "email": this.email,
    });
  }
}
