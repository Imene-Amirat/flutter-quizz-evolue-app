import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final String question;
  final VoidCallback onTrue;
  final VoidCallback onFalse;
  final VoidCallback onNext;
  final VoidCallback onRestart;
  final bool finished;
  final int score;
  final int total;

  const QuizCard({
    super.key,
    required this.question,
    required this.onTrue,
    required this.onFalse,
    required this.onNext,
    required this.onRestart,
    required this.finished,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.help_outline,
                size: 48,
                color: Color(0xFF4F46E5),
              ),
              const SizedBox(height: 16),
              Text(
                question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.check),
                      label: const Text("VRAI"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: onTrue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.close),
                      label: const Text("FAUX"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: onFalse,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              FilledButton(
                onPressed: finished ? onRestart : onNext,
                child: Text(finished ? "Recommencer" : "Question suivante"),
              ),

              const SizedBox(height: 16),

              Text(
                "Score : $score / $total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
