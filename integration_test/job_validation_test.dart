import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:hirehub/main.dart" as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Job Validation Test", (WidgetTester tester) async {
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

    Finder jobCard = find.byKey(const Key("popularDeveloper")).first;
    await tester.tap(jobCard);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text("Walmart"), findsWidgets);
    expect(find.text("Application Status:"), findsWidgets);
    expect(find.text("Apply Now"), findsNothing);
  });
}
