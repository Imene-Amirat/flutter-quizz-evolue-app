abstract class QuizEvent {}

class AnswerEvent extends QuizEvent {
  final bool answer;
  AnswerEvent(this.answer);
}

class NextEvent extends QuizEvent {}

class RestartEvent extends QuizEvent {}
