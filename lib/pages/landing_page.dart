import 'package:flutter/material.dart';

import './quiz_page.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child:  new InkWell(            //本身不可见，实现全屏触摸进行跳转
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),  //flutter中页面跳转通过路由来实现
         child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("《知识小问答》",style: new TextStyle(color: Colors.white, fontSize: 50,fontWeight: FontWeight.bold),),
            new Text("触摸开始!",style: new TextStyle(color: Colors.white70, fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}