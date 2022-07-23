import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:hirehub/main.dart" as app;
import 'package:integration_test/integration_test.dart';

void main() {
  group("Application Test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Full App Test", (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 10));

      Finder continueButton = find.byKey(const Key("btnContinue"));
      await tester.tap(continueButton);
      await tester.pumpAndSettle(const Duration(seconds: 5));

      Finder usernameText = find.byKey(const ValueKey("txtUsername"));
      Finder btnLogin = find.byKey(const ValueKey("btnLogin"));
      await tester.enterText(usernameText, "ApplicantTen");
      Finder passwordText = find.byKey(const ValueKey("txtPassword"));
      await tester.enterText(passwordText, "Abcd");
      await tester.pumpAndSettle(const Duration(seconds: 3));
      await tester.testTextInput.receiveAction(TextInputAction.done);

      // await tester.tap(btnLogin);
      // await tester.pumpAndSettle(const Duration(seconds: 10));
      // expect(find.text("Looking for Jobs?"), findsWidgets);

      // Finder jobCard = find.byKey(const Key("RecentTrainer"));
      // await tester.tap(jobCard);
      // await tester.pumpAndSettle(const Duration(seconds: 10));
      // expect(find.text("Amzaon"), findsWidgets);
    });
  });
}
