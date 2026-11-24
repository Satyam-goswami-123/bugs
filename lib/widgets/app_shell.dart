import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final narrow = MediaQuery.sizeOf(context).width < 700;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Alerts'),
        actions: [
          TextButton.icon(
            onPressed: () => context.go('/'),
            icon: const Icon(Icons.dashboard_outlined),
            label: narrow ? const SizedBox.shrink() : const Text('Dashboard'),
          ),
          TextButton.icon(
            onPressed: () => context.go('/alerts'),
            icon: const Icon(Icons.warning_amber_rounded),
            label: narrow ? const SizedBox.shrink() : const Text('Alerts'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        child: child,
      ),
    );
  }
}
