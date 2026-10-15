import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practicevskodin/main.dart';
import 'package:practicevskodin/pages/counter_page.dart';
import 'package:practicevskodin/pages/form_page.dart';
import 'package:practicevskodin/pages/gesture_page.dart';

void main() {
  testWidgets('Counter supports all actions after navigation', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.scrollUntilVisible(find.text('Кнопки и счётчик'), 200);
    await tester.tap(find.text('Кнопки и счётчик'));
    await tester.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.text('+1'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
    await tester.tap(find.text('-1'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.star));
    await tester.pump();
    expect(find.text('10'), findsOneWidget);
    await tester.tap(find.text('Сброс'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Form displays the entered name', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: FormPage()));
    await tester.enterText(find.byType(TextField), 'Анна');
    await tester.tap(find.text('Показать'));
    await tester.pump();
    expect(find.text('Привет, Анна!'), findsOneWidget);
  });

  testWidgets('Gestures toggle color and dismiss an item', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: GesturePage()));
    final square = find.ancestor(
      of: find.text('Нажми').last,
      matching: find.byType(Container),
    );
    expect(tester.widget<Container>(square).color, Colors.blue);
    await tester.tap(find.text('Нажми').last);
    await tester.pump();
    expect(tester.widget<Container>(square).color, Colors.red);
    await tester.drag(find.text('Яблоко'), const Offset(800, 0));
    await tester.pumpAndSettle();
    expect(find.text('Яблоко'), findsNothing);
    expect(find.text('Банан'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Dialog closes and tabs can be switched', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.scrollUntilVisible(find.text('Показать диалог'), 200);
    await tester.tap(find.text('Показать диалог'));
    await tester.pumpAndSettle();
    expect(find.text('Это пример диалога'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    await tester.ensureVisible(find.text('Вкладки'));
    await tester.tap(find.text('Вкладки'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Профиль'));
    await tester.pumpAndSettle();
    expect(find.text('Это профиль'), findsOneWidget);
  });

  for (final entry in <String, Widget>{
    'home': const MyApp(),
    'counter': const MaterialApp(home: CounterPage()),
    'form': const MaterialApp(home: FormPage()),
    'gestures': const MaterialApp(home: GesturePage()),
  }.entries) {
    testWidgets('${entry.key} fits a small window', (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(280, 240);
      addTearDown(tester.view.reset);
      await tester.pumpWidget(entry.value);
      expect(tester.takeException(), isNull);
    });
  }
}
