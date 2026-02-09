# Tests

This directory contains unit tests and widget tests.

## Organization
- Mirror the lib/ structure here
- Name test files with `_test.dart` suffix
- Use descriptive test names

## Example
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:thutohub/main.dart';

void main() {
  testWidgets('App starts and shows welcome message', (WidgetTester tester) async {
    await tester.pumpWidget(const ThutoHubApp());
    expect(find.text('Welcome to ThutoHub'), findsOneWidget);
  });
}
```
