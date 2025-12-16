import 'package:flutter/material.dart';
import '../data/models/question.dart';
import '../data/repositories/quiz_repository.dart';

class QuizProvider extends ChangeNotifier {
  final List<Question> _questions;
  int _index = 0;
  int _score = 0;

  QuizProvider(QuizRepository repo) : _questions = repo.getQuestions();

  Question get current => _questions[_index];
  int get score => _score;
  int get total => _questions.length;
  bool get finished => _index == _questions.length - 1;

  void answer(bool userAnswer) {
    if (userAnswer == current.answer) _score++;
    notifyListeners();
  }

  void next() {
    if (!finished) {
      _index++;
      notifyListeners();
    }
  }

  void restart() {
    _index = 0;
    _score = 0;
    notifyListeners();
  }
}
