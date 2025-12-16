import 'package:flutter/material.dart';
import 'quiz_provider_page.dart';
import 'quiz_bloc_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quizz Évolué")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.quiz, size: 80, color: Color(0xFF4F46E5)),
            const SizedBox(height: 20),
            const Text(
              "Choisissez le mode de gestion d’état",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 40),

            _ModeButton(
              title: "Mode Provider",
              subtitle: "Simple & réactif",
              icon: Icons.layers,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizProviderPage()),
              ),
            ),

            const SizedBox(height: 16),

            _ModeButton(
              title: "Mode BLoC",
              subtitle: "Architecture évoluée",
              icon: Icons.sync_alt,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizBlocPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _ModeButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: const Color(0xFFE0E7FF),
                child: Icon(icon, color: Color(0xFF4F46E5)),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
