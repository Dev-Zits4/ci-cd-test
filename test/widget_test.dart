import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_prac/main.dart';

void main() {
  testWidgets('Counter A increments smoke test', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Verify initial state
    expect(find.text('Counter A :0'), findsOneWidget);

    // Tap the increment A button
    await tester.tap(find.byKey(const Key('incrementA')));
    await tester.pump();

    // Verify the counter has incremented
    expect(find.text('Counter A :1'), findsOneWidget);
  });

  testWidgets('Counter B increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Counter B :0'), findsOneWidget);

    await tester.tap(find.byKey(const Key('incrementB')));
    await tester.pump();

    expect(find.text('Counter B :1'), findsOneWidget);
  });
}
