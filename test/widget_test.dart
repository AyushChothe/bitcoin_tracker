import 'package:bitcoin_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  const app = ProviderScope(child: App());
  testWidgets('"Price" should be visible when page loads',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.text('Price'), findsOneWidget);
  });

  testWidgets('Image(bitcon.png) should be visible when page loads',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byType(Image), findsOneWidget);
  });
}
