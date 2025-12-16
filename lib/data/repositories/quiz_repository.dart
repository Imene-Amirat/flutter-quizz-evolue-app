import '../models/question.dart';

class QuizRepository {
  List<Question> getQuestions() {
    return const [
      Question(text: "La Terre est plate.", answer: false),
      Question(text: "Le Soleil est une étoile.", answer: true),
      Question(text: "Paris est la capitale de l’Espagne.", answer: false),
      Question(text: "L’eau bout à 100°C.", answer: true),
      Question(text: "Un octet contient 8 bits.", answer: true),
    ];
  }
}
