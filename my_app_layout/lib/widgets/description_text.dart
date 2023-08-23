import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  DescriptionText({
    super.key,
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        text,
        softWrap: true,
      ),
    );
  }
}
