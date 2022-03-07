import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:detconnect/widgets/scale_on_hover.dart';
import 'package:detconnect/widgets/translate_on_hover.dart';

extension HoverExtensions on Widget {
  // Get a regerence to the body of the view
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      // When the mouse enters the widget set the cursor to pointer
      // onHover: (event) {
      //   appContainer.style.cursor = 'pointer';
      // },
      // // When it exits set it back to default
      // onExit: (event) {
      //   appContainer.style.cursor = 'default';
      // },
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }

  Widget get scaleUpOnHover {
    return ScaleOnHover(
      child: this,
      hieght: 1.05,
      width: 1,
    );
  }

  Widget get scaleDownOnHover {
    return ScaleOnHover(
      child: this,
      hieght: 0.95,
      width: 1,
    );
  }
}
