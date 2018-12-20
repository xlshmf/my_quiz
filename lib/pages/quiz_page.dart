import 'package:flutter/material.dart';
//   ./表示当前目录
//   ../表示父级目录
//   /表示根目录 (javascript)
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import '../pages/score_page.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage>{

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("打火机的发明时间比火柴晚", false),
    new Question("Java支持多继承", false),
    new Question("哥伦布1492年发现了新大陆", true),
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Stack(                 //stack可以显示在最顶端
      fit: StackFit.expand,
      children: <Widget>[
        new Column(                   //主界面
          children: <Widget>[
            new AnswerButton(true,() => handleAnswer(true)),    //点击按钮“是”
            new QuestionText(questionText,questionNumber),
            new AnswerButton(false,() => handleAnswer(false)),   
          ],
        ),
        overlayShouldBeVisible ?  new CorrectWrongOverlay(isCorrect,
          (){
            if(quiz.length == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score,quiz.length)),(Route route) => route == null);     //跳转到分数页面
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState((){
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }
}