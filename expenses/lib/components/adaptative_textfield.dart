import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final Function(String) fn;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  AdaptativeTextField({
    required this.label,
    required this.fn,
    required this.controller,
    this.keyBoardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return false
        ? CupertinoTextField(
            controller: controller,
            onSubmitted: fn,
            placeholder: label,
            keyboardType: keyBoardType,
          )
        : TextField(
            onSubmitted: fn,
            keyboardType: keyBoardType,
            controller: controller,
            decoration: InputDecoration(labelText: label),
          );
  }
}
