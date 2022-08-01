import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:hirehub/main.dart" as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Dark Mode Test", (WidgetTester tester) async {
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

    Finder settingsTab = find.byKey(const Key("settings")).first;
    await tester.tap(settingsTab);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    Finder switchKey = find.byKey(const Key("darkModeSwitch")).first;
    await tester.tap(switchKey);
    expect(find.text("Dark Mode"), findsWidgets);
  });
}
