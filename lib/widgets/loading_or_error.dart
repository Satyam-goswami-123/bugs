import 'package:flutter/material.dart';

class LoadingOrError extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final VoidCallback onRetry;
  final Widget child;

  const LoadingOrError({
    super.key,
    required this.isLoading,
    required this.error,
    required this.onRetry,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(error!, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      );
    }
    return child;
  }
}
