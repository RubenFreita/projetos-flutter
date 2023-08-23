import 'package:flutter/material.dart';

class IconsList extends StatelessWidget {
  IconsList({
    super.key,
    required this.icons,
  });

  final Map<String, IconData> icons;
  late List<Widget> itens = [];

  @override
  Widget build(BuildContext context) {
    icons.forEach((key, value) {
      itens.add(Column(
        children: [
          Icon(
            value,
            color: Colors.blue,
          ),
          Text(
            key,
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ));
    });
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: itens.toList(),
        // Column(
        //   children: [

        //     Icon(
        //       Icons.call,
        //       color: Colors.blue,
        //     ),
        //     Text(
        //       "CALL",
        //       style: TextStyle(
        //         color: Colors.blue,
        //       ),
        //     )
        //   ],
        // ),
        // Column(
        //   children: [
        //     Icon(
        //       Icons.near_me,
        //       color: Colors.blue,
        //     ),
        //     Text(
        //       "ROUTE",
        //       style: TextStyle(
        //         color: Colors.blue,
        //       ),
        //     )
        //   ],
        // ),
        // Column(
        //   children: [
        //     Icon(
        //       Icons.share,
        //       color: Colors.blue,
        //     ),
        //     Text(
        //       "SHARE",
        //       style: TextStyle(
        //         color: Colors.blue,
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
