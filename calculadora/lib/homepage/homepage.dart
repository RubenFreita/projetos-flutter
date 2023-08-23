import 'package:calculadora/homepage/widgetPersonalizados/icones.dart';
import 'package:calculadora/homepage/widgetPersonalizados/teclado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close_fullscreen_rounded),
                  color: click ? Colors.amber[800] : Colors.grey[400],
                ),
                IconButton(
                  onPressed: () {
                    this.click = !this.click;
                  },
                  icon: const Icon(Icons.calculate_rounded),
                  color: click ? Colors.amber[800] : Colors.grey[400],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.ballot_rounded),
                  color: click ? Colors.amber[800] : Colors.grey[400],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.local_atm_rounded),
                  color: click ? Colors.amber[800] : Colors.grey[400],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  color: click ? Colors.amber[800] : Colors.grey[400],
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(90)),
            ),
            const Expanded(
                child: TextField(
              maxLength: 12,
              expands: true,
              maxLines: null,
              minLines: null,
              textAlignVertical: TextAlignVertical.bottom,
              style: TextStyle(fontSize: 40.0),
              textAlign: TextAlign.end,
            )),
            const Expanded(child: Teclado()),
          ],
        ),
      ),
    );
  }
}
