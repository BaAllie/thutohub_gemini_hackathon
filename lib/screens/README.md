# Screens

This directory contains all the screen/page widgets for the app.

## Organization
- Each screen should be in its own file
- Use descriptive names (e.g., `home_screen.dart`, `learning_screen.dart`)
- Group related screens in subdirectories if needed

## Example
```dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Screen')),
    );
  }
}
```
