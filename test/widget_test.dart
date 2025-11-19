// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:liquid_glass_showcase/main.dart';

void main() {
  testWidgets('Showcase page renders expected sections',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Liquid Glass Showcase'), findsOneWidget);
    expect(find.text('Floating Glass Cards'), findsOneWidget);
    expect(find.text('Interactive Glass Panels'), findsOneWidget);
    expect(find.text('Glass Morphism Showcase'), findsOneWidget);

    expect(find.text('Card 1'), findsOneWidget);
    expect(find.text('Card 6'), findsOneWidget);
  });
}
