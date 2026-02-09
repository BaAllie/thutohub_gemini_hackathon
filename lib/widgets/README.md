# Widgets

This directory contains reusable widget components.

## Organization
- Keep widgets small and focused
- Create custom widgets for repeated UI patterns
- Group related widgets in subdirectories if needed

## Example
```dart
import 'package:flutter/material.dart';

class ConceptCard extends StatelessWidget {
  final String title;
  final String description;

  const ConceptCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}
```
