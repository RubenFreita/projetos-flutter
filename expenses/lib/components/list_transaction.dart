import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class ListTransaction extends StatelessWidget {
  const ListTransaction({
    required this.removeTrans,
    Key? key,
    required this.transactions,
  }) : super(key: key);

  final List<Transaction> transactions;
  final Function(int) removeTrans;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.1 * constraints.maxHeight,
                ),
                Container(
                  height: 0.07 * constraints.maxHeight,
                  child: FittedBox(
                    child: Text(
                      "Sem Transações Cadastradas!",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.1 * constraints.maxHeight,
                ),
                Container(
                  width: 200,
                  height: 0.7 * constraints.maxHeight,
                  child: Image.asset(
                    "assets\\images\\waiting.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: 0.03 * constraints.maxHeight,
                ),
              ],
            );
          })
        : Container(
            //height: 400,
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                Transaction tr = transactions[index];
                return TransactionItem(
                  index: index,
                  tr: tr,
                  removeTrans: removeTrans,
                );
              },
            ),
          );
  }
}
