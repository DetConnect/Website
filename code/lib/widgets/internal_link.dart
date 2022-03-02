import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;
import 'package:code/widgets/navigation_bar.dart';
import 'package:code/extensions/hover_extension.dart';

class InternalLink extends StatelessWidget {
  final int page;
  final Icon icon;

  const InternalLink({
    this.page = 0,
    this.icon = const Icon(
      Icons.play_arrow,
      size: 100,
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: this.icon,
        onTap: () {
          NavigationBar.of(context).setPage(this.page);
        },
      ),
    ).showCursorOnHover.moveUpOnHover;
  }
}
