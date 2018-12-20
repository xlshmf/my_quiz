import './question.dart';

class Quiz{
  List<Question> _questions;
  int _currentQustionIndex = -1;
  int _score = 0;

  Quiz(this._questions){
    _questions.shuffle();
  }

  //dart中getter的语法, return _score
  int get score => _score;
  int get length => _questions.length;
  int get questionNumber => _currentQustionIndex + 1;
  List<Question> get questions => _questions;
  
  Question get nextQuestion {
    _currentQustionIndex++;
    if(_currentQustionIndex >= length) return null;
    return _questions[_currentQustionIndex];
  }

  void answer(bool isCorrect){
    if(isCorrect) _score++;
  }
}