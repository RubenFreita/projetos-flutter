import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  TitleSection({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 30, right: 30),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Color.fromARGB(255, 255, 102, 0),
          ),
          Text("41"),
        ],
      ),
    );
  }
}
