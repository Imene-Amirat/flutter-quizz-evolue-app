import 'dart:async';
import '../../data/models/question.dart';
import '../../data/repositories/quiz_repository.dart';
import '../events/quiz_event.dart';

class QuizState {
  final int index;
  final int score;
  final List<Question> questions;

  QuizState(this.index, this.score, this.questions);

  Question get current => questions[index];
  bool get finished => index == questions.length - 1;
}

class QuizBloc {
  final _stateController = StreamController<QuizState>();
  final _eventController = StreamController<QuizEvent>();

  Stream<QuizState> get stream => _stateController.stream;
  Sink<QuizEvent> get sink => _eventController.sink;

  late QuizState _state;

  QuizBloc(QuizRepository repo) {
    _state = QuizState(0, 0, repo.getQuestions());
    _stateController.add(_state);
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(QuizEvent event) {
    if (event is AnswerEvent) {
      if (event.answer == _state.current.answer) {
        _state = QuizState(_state.index, _state.score + 1, _state.questions);
      }
    }

    if (event is NextEvent && !_state.finished) {
      _state = QuizState(_state.index + 1, _state.score, _state.questions);
    }

    if (event is RestartEvent) {
      _state = QuizState(0, 0, _state.questions);
    }

    _stateController.add(_state);
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
