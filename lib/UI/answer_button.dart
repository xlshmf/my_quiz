import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{

final bool _answer;
final VoidCallback _onTap;   //这是一个typedef ,void=>没有返回值，_onTap=>函数名 

AnswerButton(this._answer,this._onTap);

  @override
  Widget build(BuildContext context){
  return  new Expanded(            
    child: new Material(
      color: _answer == true ? Colors.greenAccent : Colors.redAccent,
      child: new InkWell(
        onTap: () => _onTap(),
        child: new Center(
          child: new Container(
            decoration: new BoxDecoration(
              border: new Border.all(color: Colors.white, width: 5)
            ),
            padding: new EdgeInsets.all(30),
            child: new Text(_answer == true ? "True" : "False",
              style: new TextStyle(color: Colors.white,fontSize: 40, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    ),
  );
  }
}