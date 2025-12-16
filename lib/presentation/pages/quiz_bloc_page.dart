import 'package:flutter/material.dart';
import '../../business_logic/bloc/quiz_bloc.dart';
import '../../business_logic/events/quiz_event.dart';
import '../../data/repositories/quiz_repository.dart';
import '../widgets/quiz_card.dart';

class QuizBlocPage extends StatefulWidget {
  const QuizBlocPage({super.key});

  @override
  State<QuizBlocPage> createState() => _QuizBlocPageState();
}

class _QuizBlocPageState extends State<QuizBlocPage> {
  late QuizBloc bloc;

  @override
  void initState() {
    bloc = QuizBloc(QuizRepository());
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quizz - BLoC")),
      body: StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          final state = snapshot.data!;
          return Center(
            child: QuizCard(
              question: state.current.text,
              onTrue: () => bloc.sink.add(AnswerEvent(true)),
              onFalse: () => bloc.sink.add(AnswerEvent(false)),
              onNext: () => bloc.sink.add(NextEvent()),
              onRestart: () => bloc.sink.add(RestartEvent()),
              finished: state.finished,
              score: state.score,
              total: state.questions.length,
            ),
          );
        },
      ),
    );
  }
}
