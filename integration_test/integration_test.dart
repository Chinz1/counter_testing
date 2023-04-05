import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-End testing', () {
    testWidgets('Counter should start with zero', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('CONTAGEM'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Make counter increase number', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder incrementButton = find.byKey(const Key('incrementButton'));

      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Make counter decrease number', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder decrementButton = find.byKey(const Key('decrementButton'));

      await tester.tap(decrementButton);
      await tester.pumpAndSettle();

      expect(find.text('-1'), findsOneWidget);
    });

    testWidgets('Make counter reset number', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder incrementButton = find.byKey(const Key('incrementButton'));

      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);

      final Finder resetButton = find.byKey(const Key('resetButton'));

      await tester.tap(resetButton);
      await tester.pumpAndSettle();

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Make multiple operations in counter and check final result',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final Finder incrementButton = find.byKey(const Key('incrementButton'));
      final Finder decrementButton = find.byKey(const Key('decrementButton'));
      final Finder resetButton = find.byKey(const Key('resetButton'));

      await tester.tap(incrementButton);
      await tester.tap(incrementButton);
      await tester.tap(incrementButton);
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();
      expect(find.text('4'), findsOneWidget);

      await tester.tap(decrementButton);
      await tester.tap(decrementButton);
      await tester.tap(decrementButton);
      await tester.tap(decrementButton);
      await tester.tap(decrementButton);
      await tester.tap(decrementButton);
      await tester.tap(decrementButton);
      await tester.tap(decrementButton);
      await tester.tap(decrementButton);
      await tester.pumpAndSettle();
      expect(find.text('-5'), findsOneWidget);

      await tester.tap(resetButton);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
    });
  });
}
