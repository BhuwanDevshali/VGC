import 'package:flutter_test/flutter_test.dart';
import 'package:VGC_cabs/main.dart';

void main() {
  testWidgets('Test VGC Cabs App', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(VGCCabsApp());

    // Verify that our app has a title.
    expect(find.text('VGC Cabs'), findsOneWidget);

    // TODO: Write more test cases to test the functionality of the app.
  });
}