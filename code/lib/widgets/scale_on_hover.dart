import 'package:flutter/material.dart';

class ScaleOnHover extends StatefulWidget {
  final Widget child;
  final double hieght;
  final double width;

  // You can also pass the translation in here if you want to
  ScaleOnHover({Key key, this.child, this.hieght, this.width})
      : super(key: key);
  @override
  _ScaleOnHoverState createState() =>
      _ScaleOnHoverState(this.hieght, this.width);
}

class _ScaleOnHoverState extends State<ScaleOnHover> {
  var nonHoverTransform;
  var hoverTransform;
  bool _hovering = false;

  _ScaleOnHoverState(double hieght, double width) {
    nonHoverTransform = Matrix4.identity()..scale(1, 1, 1);
    hoverTransform = Matrix4.identity()..scale(hieght, width, 1);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
