import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/quiz_provider.dart';
import '../widgets/quiz_card.dart';

class QuizProviderPage extends StatelessWidget {
  const QuizProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Quizz - Provider")),
      body: Center(
        child: QuizCard(
          question: quiz.current.text,
          onTrue: () => quiz.answer(true),
          onFalse: () => quiz.answer(false),
          onNext: quiz.next,
          onRestart: quiz.restart,
          finished: quiz.finished,
          score: quiz.score,
          total: quiz.total,
        ),
      ),
    );
  }
}
