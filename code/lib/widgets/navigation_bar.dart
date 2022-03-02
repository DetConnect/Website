import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;
import 'package:code/pages/mission.dart';
import 'package:code/pages/join.dart';
import 'package:code/extensions/hover_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationBarState();

  static _NavigationBarState of(BuildContext context) =>
      context.findAncestorStateOfType<_NavigationBarState>();
}

class _NavigationBarState extends State<NavigationBar> {
  int page = 0;
  final pages = [Mission(), Join()];

  void setPage(int page) {
    setState(() {
      this.page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: new Container(
          decoration: new BoxDecoration(
            color: Colors.blue[900],
          ),
        ),
        title: Row(children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage("images/IconWhite.png")),
                )),
          ),
        ]),
        actions: [
          _NavigationBarItem("Mission", 0, page == 0),
          _NavigationBarItem("Join Us", 1, page == 1),
          _NavigationBarLink(
            "https://detconnect.slack.com",
            const Icon(
              FontAwesomeIcons.slack,
              size: 20,
              color: Colors.grey,
            ),
          ),
          _NavigationBarLink(
            "https://drive.google.com/drive/u/0/folders/0AC-pLgUaHqASUk9PVA",
            const Icon(
              FontAwesomeIcons.googleDrive,
              size: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: pages[page],
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  final String title;
  final int pageId;
  final bool current;

  const _NavigationBarItem(
    this.title,
    this.pageId,
    this.current, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: this.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: current ? Colors.white : Colors.grey,
                        fontFamily: 'Roboto'),
                  ),
                ]),
          ),
          onTap: () {
            NavigationBar.of(context).setPage(pageId);
          },
        ),
      ).showCursorOnHover.moveUpOnHover,
    );
  }
}

class _NavigationBarLink extends StatelessWidget {
  final String link;
  final Icon icon;

  const _NavigationBarLink(
    this.link,
    this.icon, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: this.icon,
          onTap: () {
            html.window.open(this.link, "Link");
          },
        ),
      ).showCursorOnHover.moveUpOnHover,
    );
  }
}
