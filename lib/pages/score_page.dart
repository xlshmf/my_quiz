import 'package:flutter/material.dart';

import './landing_page.dart';

class ScorePage extends StatelessWidget{

  final int score;
  final int totalQuestions;

  ScorePage(this.score,this.totalQuestions);

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.purpleAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("你的得分为: ",style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50)),
          new Text(score.toString() + "/" + totalQuestions.toString(),style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 50)),
          new IconButton(
            icon: new Icon(Icons.refresh),
            color: Colors.white,
            iconSize: 150,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null),    //跳转到加载页面
          ),
          new Container(
            child: new Text("再来一次！",style: new TextStyle(color: Colors.white,fontSize: 30),),
          ),
          new Padding(
            padding: new EdgeInsets.only(bottom: 50),
          ),
          new Text("或按返回键退出程序",style: new TextStyle(color: Colors.white70,fontSize: 15))
        ],
      ),
    );
  }
}
