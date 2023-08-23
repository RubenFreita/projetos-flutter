import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home()
  ));
}



class Home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  int _people = 0;
  String _info = "Pode Entrar";
  void _changePeople(int delta){
    setState(() {
      _people += delta;
      if (_people < 0){
        _info = "Mundo Invertido";
      }else if(_people <= 10){
        _info = "Pode Entrar";
      }else{
        _info = "Lotado!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
              "images/restaurant.jpg",
              fit: BoxFit.cover,
              height: 1000.0,
            ),
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Pessoas: $_people", 
          style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Padding(
              padding: EdgeInsets.all(30.0),
              child: FlatButton(
                child: Text(
                  "+1",
                  style: TextStyle(fontSize: 30.0, color: Colors.white
                  )),
                onPressed: (){
                  _changePeople(1);
                },
              ),

            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: FlatButton(
                child: Text(
                  "-1",
                  style: TextStyle(fontSize: 30.0, color: Colors.white
                  )),
                onPressed: (){
                  _changePeople(-1);
                },
              ),

            ),
        ],),
        Text(
          "$_info", 
          style:TextStyle(
            color: Colors.white, 
            fontStyle: FontStyle.italic, 
            fontSize: 30.0),
        )
        ],
    )
    ],
    );
  }
}