import 'package:flutter/material.dart';

class Icones extends StatefulWidget {
  final IconData valor;
  bool click;

  Icones(this.valor, {this.click = false, Key? key}) : super(key: key);

  @override
  State<Icones> createState() => _IconesState();
}

class _IconesState extends State<Icones> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: IconButton(
        onPressed: () {
          setState(() {
            widget.click = !widget.click;
          });
        },
        icon: Icon(
          widget.valor,
          color: widget.click ? Colors.amber[800] : Colors.grey[400],
        ),
      ),
    );
  }
}
