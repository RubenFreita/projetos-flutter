import 'package:calculadora/homepage/widgetPersonalizados/icones.dart';
import 'package:flutter/material.dart';

class Teclado extends StatefulWidget {
  const Teclado({Key? key}) : super(key: key);

  @override
  State<Teclado> createState() => _TecladoState();
}

class _TecladoState extends State<Teclado> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "AC",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber[800],
                ),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "%",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.amber[800],
                  ),
                ),
              ),
            ),
            Icones(Icons.backspace_outlined),
            TextButton(
              onPressed: () {},
              child: Text(
                "÷",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.amber[800],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "7",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "8",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "9",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "x",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.amber[800],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "4",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "5",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "6",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "-",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.amber[800],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "2",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "3",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "+",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.amber[800],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.restart_alt_rounded,
                color: Colors.amber[800],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "0",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                ",",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber[800],
                  ),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
