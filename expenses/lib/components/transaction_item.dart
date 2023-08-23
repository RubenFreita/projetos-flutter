import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    required this.index,
    Key? key,
    required this.tr,
    required this.removeTrans,
  }) : super(key: key);

  final Transaction tr;
  final Function(int p1) removeTrans;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      elevation: 6,
      child: ListTile(
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: CircleAvatar(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "R\$" + tr.value.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        subtitle: Text(DateFormat("d MMMM y", "pt-BR").format(tr.dateTime)),
        trailing: IconButton(
          onPressed: () => removeTrans(index),
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
