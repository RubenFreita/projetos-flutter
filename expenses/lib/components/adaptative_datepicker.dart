import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeDatePicker extends StatelessWidget {
  AdaptativeDatePicker({required this.fn});
  final void Function(DateTime) fn;

  @override
  Widget build(BuildContext context) {
    return false
        ? CupertinoButton(
            child: Text("Selecionar Data"),
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 216,
                    padding: const EdgeInsets.only(top: 6.0),
                    // The Bottom margin is provided to align the popup above the system
                    // navigation bar.
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: SafeArea(
                      top: false,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (date) => fn(date),
                        initialDateTime: DateTime.now(),
                        minimumDate: DateTime(2019),
                        maximumDate: DateTime.now(),
                      ),
                    ),
                  );
                },
              );
            },
          )
        : TextButton(
            child: Text(
              "Data da Transação",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2019),
                lastDate: DateTime.now(),
              ).then((datePicker) {
                if (datePicker == null) {
                  return;
                }
                fn(datePicker);
              });
            },
          );
  }
}
