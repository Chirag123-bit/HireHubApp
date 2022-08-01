import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:hirehub/main.dart" as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Add Events Test", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    Finder continueButton = find.byKey(const Key("btnContinue"));
    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    Finder usernameText = find.byKey(const ValueKey("txtUsername"));
    Finder btnLogin = find.byKey(const ValueKey("btnLogin"));
    await tester.enterText(usernameText, "ApplicantTen");
    Finder passwordText = find.byKey(const ValueKey("txtPassword"));
    await tester.enterText(passwordText, "Abcd");
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(btnLogin);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    Finder eventsTab = find.byKey(const ValueKey("eventsTab"));
    await tester.tap(eventsTab);
    await tester.pumpAndSettle(const Duration(seconds: 3));
    Finder eventsTile = find.byKey(const ValueKey("eventsTile"));
    await tester.tap(eventsTile);
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byKey(const ValueKey("addEvent")), findsOneWidget);
  });
}
