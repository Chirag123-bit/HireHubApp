import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hirehub/screens/applicant/settings/change_password_screen.dart';
import 'package:hirehub/screens/auth/Login.dart';

void main() {
  testWidgets("Setting Test", (WidgetTester test) async {
    await test.pumpWidget(
      MaterialApp(
        title: "Settings Screen",
        home: ChangePasswordScreen(),
      ),
    );
    await test.pumpAndSettle();
    Finder darkMode = find.byKey(const ValueKey("darkModeSlider"));
    expect(find.text("Old Password"), findsWidgets);
  });
  testWidgets("Home Jobs Test", (WidgetTester test) async {
    await test.pumpWidget(
      const MaterialApp(
        title: "Arithmetic",
        home: LoginScreen(),
      ),
    );

    Finder usernameText = find.byKey(const ValueKey("txtUsername"));
    await test.enterText(usernameText, "ApplicantTen");
    Finder passwordText = find.byKey(const ValueKey("txtPassword"));
    await test.enterText(passwordText, "Abcd");

    Finder btnLogin = find.byKey(const ValueKey("btnLogin"));
    await test.tap(btnLogin);
    await test.pumpAndSettle();
    expect(find.text("Looking for Jobs?"), findsWidgets);
  });
  testWidgets("Find Company Name on jobs card", (WidgetTester test) async {
    await test.pumpWidget(
      const MaterialApp(
        title: "Login Screen",
        home: LoginScreen(),
      ),
    );

    Finder usernameText = find.byKey(const ValueKey("txtUsername"));
    await test.enterText(usernameText, "ApplicantTen");
    Finder passwordText = find.byKey(const ValueKey("txtPassword"));
    await test.enterText(passwordText, "Abcd");
    await test.testTextInput.receiveAction(TextInputAction.done);
    await test.pumpAndSettle(const Duration(seconds: 10));

    Finder btnLogin = find.byKey(const Key("btnLogin"));
    await test.tap(btnLogin);
    await test.pumpAndSettle(const Duration(seconds: 5));
    Finder jobCard = find.byKey(const Key("popularDeveloper"));
    await test.tap(jobCard);
    await test.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text("Walmart"), findsWidgets);
    expect(find.text("Requirements"), findsWidgets);
  });
}
