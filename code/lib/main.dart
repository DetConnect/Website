import 'package:flutter/material.dart';
import 'package:code/widgets/navigation_bar.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Roboto',
            backgroundColor: Colors.black,
            canvasColor: Colors.black),
        home: NavigationBar());
  }
}
