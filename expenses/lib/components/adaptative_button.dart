import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() fn;
  const AdaptativeButton({required this.fn, required this.label, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return false
        ? CupertinoButton(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Text(label),
            onPressed: fn,
            color: Theme.of(context).colorScheme.primary,
          )
        : TextButton(
            onPressed: fn,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          );
  }
}
