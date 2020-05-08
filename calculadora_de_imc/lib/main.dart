import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weigthControler = TextEditingController();
  TextEditingController heigthControler = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _info = "Informe os seus dados!!";


  void _reset(){
    weigthControler.text = "";
    heigthControler.text = "";
    setState(() {
      _info = "Informe os seus dados!!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculator(){
    double imc = 0.0;
    double peso = double.parse(weigthControler.text);
    double altura = double.parse(heigthControler.text)/100;

    imc = peso / (altura * altura);

    setState(() {
      if(imc < 18.6){
        _info = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 18.6 && imc < 24.9){
        _info = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 24.9 && imc < 29.9){
        _info = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 29.9 && imc < 34.9){
        _info = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 34.9 && imc < 39.9){
        _info = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      }else if(imc >= 40){
        _info = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _reset,)
        ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 200.0, color: Colors.green,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Peso (Kg)", labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: weigthControler,
              validator: (value){
                if(value.isEmpty){
                  return "Insira seu Peso!!";
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Altura (cm)", labelStyle: TextStyle(color: Colors.green)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: heigthControler,
              validator: (value){
                if(value.isEmpty){
                  return "Insira sua Altura!!";
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
              height: 50.0,
              child: 
                RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      _calculator();
                    }
                  },
                  child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.green,
                  ),
              ),
            ),
            
              Text(
                _info, 
                textAlign: TextAlign.center, 
                style: TextStyle(fontSize: 20.0, color: Colors.green))
            ],
        ),
          ),
        
        )
        

        
    );
  }
}