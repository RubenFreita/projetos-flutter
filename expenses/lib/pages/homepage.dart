import 'dart:io';
import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:flutter/cupertino.dart';
import '../models/transaction.dart';
import '../components/list_transaction.dart';
import '../components/form_transaciton.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int idAux = 0;
  final transactions = <Transaction>[];
  bool mudarBody = true;

  List<Transaction> get _recentTransaction {
    return transactions.where((tr) {
      return tr.dateTime.isAfter(
        DateTime.now().subtract(
          Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  double get valorTotal {
    return _recentTransaction.fold(0, (prev, element) => prev + element.value);
  }

  void _removeTransaction(int id) {
    idAux = id;
    setState(() {
      transactions.removeAt(id);
    });
  }

  void _adicionaTransaction(String tit, double value, DateTime date) {
    Transaction newTransaction = Transaction(
      id: Random().nextDouble().toInt(),
      dateTime: date,
      title: tit,
      value: value,
    );

    setState(() {
      transactions.add(newTransaction);
      Navigator.of(context).pop();
    });
  }

  void _openTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return FormTransaction(adicionaTransaction: _adicionaTransaction);
        });
  }

  void mudar() {
    setState(() {
      mudarBody = !mudarBody;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _getIconButton(IconData icon, Function() fn) {
      return false
          ? GestureDetector(
              onTap: fn,
              child: Icon(
                icon,
                color: Colors.white,
              ))
          : IconButton(icon: Icon(icon), onPressed: fn);
    }

    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final actions = [
      if (isLandscape)
        mudarBody
            ? _getIconButton(Icons.show_chart, mudar)
            : _getIconButton(Icons.list, mudar),
      _getIconButton(
        false ? CupertinoIcons.add : Icons.add,
        () => _openTransactionModal(context),
      ),
    ];
    final appBar = AppBar(
      title: const Text(
        "Despesas Pessoais",
      ),
      actions: actions,
    );

    final tamTelaTotal = MediaQuery.of(context).size.height;
    final tamAppBar = appBar.preferredSize.height;
    final tamStatusBar = MediaQuery.of(context).padding.top;
    final tamTelaBody = tamTelaTotal - tamAppBar - tamStatusBar;

    final bodyPage = SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!mudarBody || !isLandscape)
            Container(
              height: isLandscape ? tamTelaBody * 0.7 : tamTelaBody * 0.3,
              child: Chart(
                recentTransaction: _recentTransaction,
                allValue: valorTotal,
              ),
            ),
          if (mudarBody || !isLandscape)
            SizedBox(
              height: isLandscape ? tamTelaBody * 1 : tamTelaBody * 0.7,
              child: ListTransaction(
                transactions: _recentTransaction,
                removeTrans: _removeTransaction,
              ),
            ),
        ],
      ),
    );

    return false
        ? SafeArea(
            child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                middle: Text(
                  "Despesas Pessoais",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions,
                ),
              ),
              child: bodyPage,
            ),
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () => _openTransactionModal(context),
            ),
          );
  }
}
