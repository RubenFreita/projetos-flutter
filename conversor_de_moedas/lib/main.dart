import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=3c231cca";


void main () async { 
  runApp(
    MaterialApp(
      home: Home(

        ),
      theme: ThemeData(
        backgroundColor: Colors.black,
        hintColor: Colors.amber,
        inputDecorationTheme: InputDecorationTheme(
          prefixStyle: TextStyle(color: Colors.amber),
          hintStyle: TextStyle(color: Colors.amber[200]),
          labelStyle: TextStyle(color: Colors.amber),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber
              )
            )
          )
        ),
      )
    );
  
  }

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double dolar;
  double euro;

  final realControler =   TextEditingController();
  final dolarControler =   TextEditingController();
  final euroControler =   TextEditingController();

  void _clearAll(){
    realControler.text = '';
    dolarControler.text = '';
    euroControler.text = '';
  }

  void _realChange(String text){
    
    if(text.isEmpty){
      _clearAll();
      return;
    }

    double real = double.parse(text);
    dolarControler.text = (real/dolar).toStringAsFixed(2);
    euroControler.text = (real/euro).toStringAsFixed(2);
  }
  void _dolarChange(String text){

    if(text.isEmpty){
      _clearAll();
      return;
    }

    double dolar = double.parse(text);
    realControler.text = (dolar * this.dolar).toStringAsFixed(2);
    euroControler.text = (dolar/this.dolar * this.euro).toStringAsFixed(2);
  }
  void _euroChange(String text){

    if(text.isEmpty){
      _clearAll();
      return;
    }

    double euro = double.parse(text);
    dolarControler.text = (euro * this.euro / dolar).toStringAsFixed(2);
    realControler.text = (euro * this.euro).toStringAsFixed(2);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "\$ Conversor de Moedas \$", 
          style: TextStyle(
            
            fontSize: 20.0),
            ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando Dados...", 
                  style: TextStyle(
                    color: Colors.amber, 
                    fontSize: 25.0),
                  textAlign: TextAlign.center,)
                
                  );
            default:
              if (snapshot.hasError) {
                return Center(
                child: Text(
                  "Erro ao Carregar Dados", 
                  style: TextStyle(
                    color: Colors.amber, 
                    fontSize: 25.0),
                  textAlign: TextAlign.center,)
                  );
              }else{
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];


                return SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.monetization_on, size: 150.0, color: Colors.amber),
                      Divider(height: 20.0,),
                      buildTextField("Reais", "R\$ ", realControler, _realChange),
                      Divider(),
                      buildTextField("Dólares", "US\$ ", dolarControler, _dolarChange),
                      Divider(),
                      buildTextField("Euros", "€ ", euroControler, _euroChange),
                    ],
                  ),
                );
              }
          }
        },
        ),
    );
  }
}

Widget buildTextField(String label, prefix, TextEditingController con, Function fun){
  return TextField(
    onChanged: fun,
    controller: con,
    keyboardType: TextInputType.numberWithOptions(),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
      hintText: "Digite o valor",
      ),
    style: TextStyle(color: Colors.amber),
    );
}