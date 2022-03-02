import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;
import 'package:code/extensions/hover_extension.dart';

class InputTextBox extends StatelessWidget {
  String name;
  String label;
  String hint;

  InputTextBox({
    this.name = "John Smith",
    this.label = "Name",
    this.hint = "John Smith",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            labelText: this.label,
            hintText: this.hint,
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
      ],
    );
  }
}
