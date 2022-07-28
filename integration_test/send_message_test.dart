import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:hirehub/main.dart" as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Send Message Test", (WidgetTester tester) async {
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

    Finder chatTab = find.byKey(const Key("chat")).first;
    await tester.tap(chatTab);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    // expect(find.text("Chirag Simkhada"), findsWidgets);
    Finder chat = find.byKey(const Key("Chiragkey")).first;
    await tester.tap(chat);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    Finder msgBox = find.byKey(const Key("messageBox"));
    await tester.enterText(msgBox, "Hello");
    Finder sendBtn = find.byIcon(Icons.send);
    await tester.tap(sendBtn);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text("Hello"), findsWidgets);
  });
}
