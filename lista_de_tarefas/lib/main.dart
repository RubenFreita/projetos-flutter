import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


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
  List _toDoList = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;
  final _insertDo = TextEditingController();

  @override
  void initState(){
    super.initState();
    _readData().then((data){
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }


  void _addToDo(){
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["title"] = _insertDo.text;
      _insertDo.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);
      _saveData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Lista de Tarefas"),
      ),
      body: Column(
          
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                  controller: _insertDo,
                  decoration: InputDecoration(
                    labelText: "Nova Tarefa",
                    hintText: "Adicione uma Nova Tarefa",
                    hintStyle: TextStyle(color: Colors.black26),
                    labelStyle: TextStyle(color: Colors.blue
                  ),
                ),
                ),

                ),
                RaisedButton(
                  onPressed: _addToDo,
                  child: Text("ADD", style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                ),
                
              ],
            ),),
            Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10.0),
                    itemCount: _toDoList.length,
                    itemBuilder: itemBuilder,
                  ),
                ),
            
          ],
        ),
      
    );
  }

  Widget itemBuilder(BuildContext context, int index){
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_toDoList[index]["title"]),
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar(
          child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
          ),
                        
          onChanged: (c){
            setState(() {
              _toDoList[index]["ok"] = c;
              _saveData();
              });
                          
            },
          
        ),
        onDismissed: (direction){
          setState(() {
            _lastRemoved = Map.from(_toDoList[index]);
          _lastRemovedPos = index;
          _toDoList.removeAt(index);

          _saveData();

          final snack = SnackBar(
            content: Text("Tarefa ${_lastRemoved["title"]} Removida!!"),
            action: SnackBarAction(label: "Desfazer",
              onPressed: (){
                setState(() {
                  _toDoList.insert(_lastRemovedPos, _lastRemoved);
                _saveData();
                });
                
              },),
            duration: Duration(seconds: 2),
          );
          Scaffold.of(context).showSnackBar(snack);
          });
          
        },
      );
    }



  Future<File> _getFile() async{
    final diretory = await getApplicationDocumentsDirectory();
    return File("${diretory.path}/data.json");
  }

  Future<File> _saveData() async{
    String data = jsonEncode(_toDoList);

    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async{
    
    try {
      final file = await _getFile();

      return file.readAsString();
      
    } catch (e) {
      return null;
    }
    

  }
}

