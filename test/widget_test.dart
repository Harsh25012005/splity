import 'package:flutter_test/flutter_test.dart';

import 'package:splity/main.dart';

void main() {
  testWidgets('App displays application name test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app displays 'splity'.
    expect(find.text('splity'), findsOneWidget);
  });
}
