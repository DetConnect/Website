import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;

import 'package:detconnect/extensions/hover_extension.dart';

class Link extends StatelessWidget {
  final String link;
  final Icon icon;

  const Link({
    this.link = "https://flutter.dev",
    this.icon = const Icon(
      Icons.link,
      size: 20,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
