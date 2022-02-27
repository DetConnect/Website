import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// Stateless Widget to load data
class TextFromFile extends StatelessWidget {
  final String fileName;
  final Color textColor;

  const TextFromFile({
    this.fileName = "assets/text/about.txt",
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: readData(),
        builder: (context, AsyncSnapshot<String> snapShot) {
          if (snapShot.hasData) {
            return RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: snapShot.data,
                      style: TextStyle(
                          color: this.textColor,
                          fontFamily: 'Roboto',
                          fontSize: 15),
                    ),
                  ]),
            );
          } else {
            return Text("Error: " + snapShot.error.toString());
          }
        });
  }

  Future<String> readData() async {
    return await rootBundle.loadString(this.fileName);
  }
}
