import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:code/widgets/text_card.dart';
import 'package:code/widgets/internal_link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkCard extends StatefulWidget {
  final String title;
  final String text;
  final int page;

  // You can also pass the translation in here if you want to
  LinkCard({Key key, this.text, this.title, this.page}) : super(key: key);
  @override
  _LinkCardState createState() => _LinkCardState(title, text, page);
}

class _LinkCardState extends State<LinkCard> {
  String title;
  String text;
  int page;
  bool _hovering = false;

  _LinkCardState(String title, String text, int page) {
    this.title = title;
    this.text = text;
    this.page = page;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        child: _hovering
            ? Padding(
                padding: const EdgeInsets.all(15),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextCard(title: this.title, text: this.text),
                  InternalLink(page: this.page),
                ]))
            : Padding(
                padding: const EdgeInsets.all(15),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextCard(title: this.title, text: this.text),
                  Padding(padding: EdgeInsets.all(50)),
                ])),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
