import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({
    required this.allValue,
    required this.recentTransaction,
    Key? key,
  }) : super(key: key);
  final List<Transaction> recentTransaction;
  final double allValue;

  List<Map<String, Object>> get _groupTransRecents {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double somaTotal = 0;

      for (var i in recentTransaction) {
        bool sameDay = i.dateTime.day == weekDay.day;
        bool samemonth = i.dateTime.month == weekDay.month;
        bool sameyear = i.dateTime.year == weekDay.year;
        if (sameDay && samemonth && sameyear) {
          somaTotal += i.value;
        }
      }
      return {
        "day": DateFormat.E("pt-BR").format(weekDay),
        "value": somaTotal,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    _groupTransRecents;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(
        10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupTransRecents.reversed.map((tr) {
            return Expanded(
              child: ChartBar(
                value: tr["value"] as double,
                percent: ((tr["value"] as double) / allValue),
                weekDay: tr["day"].toString(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
