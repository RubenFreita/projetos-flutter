import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_datepicker.dart';
import 'package:expenses/components/adaptative_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class FormTransaction extends StatefulWidget {
  FormTransaction({Key? key, required this.adicionaTransaction})
      : super(key: key);

  void Function(String, double, DateTime) adicionaTransaction;

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  final TextEditingController _controllerValue = TextEditingController();

  final TextEditingController _controllerTitle = TextEditingController();
  DateTime _dateTimePicker = DateTime.now();

  void onSubmited() {
    final title = _controllerTitle.text;
    if (_controllerValue.text.contains(",")) {
      _controllerValue.text = _controllerValue.text.replaceAll(",", ".");
    }
    final value = double.tryParse(_controllerValue.text) ?? 0.0;

    if (value < 0 ||
        title.isEmpty ||
        _controllerValue.text == "" ||
        _dateTimePicker == DateTime(2017)) {
      return;
    }
    widget.adicionaTransaction(title, value, _dateTimePicker);
  }

  void _alteraDatePiker(DateTime date) {
    setState(() {
      _dateTimePicker = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
          5, 5, 5, 10 + MediaQuery.of(context).viewInsets.bottom),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AdaptativeTextField(
                label: "Título",
                fn: (value) => onSubmited(),
                controller: _controllerTitle,
              ),
              SizedBox(
                height: 5,
              ),
              AdaptativeTextField(
                label: "Valor",
                fn: (value) => onSubmited(),
                controller: _controllerValue,
                keyBoardType: TextInputType.numberWithOptions(decimal: true),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Data Selecionada: " +
                        DateFormat("dd/MM/y").format(_dateTimePicker),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AdaptativeDatePicker(fn: _alteraDatePiker)
                  // TextButton(
                  //child: Text(
                  //  "Data da Transação",
                  // style: TextStyle(
                  //  fontSize: 14,
                  // color: Theme.of(context).colorScheme.primary,
                  //),
                  //),
                  //onPressed: _showDatePicker,
                  //),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                      fn: () => onSubmited(), label: "Adicionar Transação"),
                  //ElevatedButton(onPressed: onPressed, child: child)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
