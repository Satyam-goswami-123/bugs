import 'package:flutter/material.dart';

class SeverityChip extends StatelessWidget {
  final String severity;

  const SeverityChip({super.key, required this.severity});

  @override
  Widget build(BuildContext context) {
    final normalized = severity.toLowerCase();
    final (color, background) = switch (normalized) {
      'high' => (const Color(0xFFB42318), const Color(0xFFFEE4E2)),
      'medium' => (const Color(0xFFB54708), const Color(0xFFFFE7CC)),
      'low' => (const Color(0xFF475467), const Color(0xFFECEFF3)),
      _ => (const Color(0xFF475467), const Color(0xFFECEFF3)),
    };

    final label = switch (normalized) {
      'high' => 'High',
      'medium' => 'Medium',
      'low' => 'Low',
      _ => 'Low',
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w700, fontSize: 12)),
    );
  }
}
