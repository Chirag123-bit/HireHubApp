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
    expect(find.text("Old Password"),
        findsWidgets); // Validates that the text "Old Password" is displayed
  });
  testWidgets("Home Banner Test", (WidgetTester test) async {
    await test.pumpWidget(
      const MaterialApp(
        title: "Home Banner",
        home: LoginScreen(),
      ),
    );

    Finder usernameText = find.byKey(const ValueKey("txtUsername"));
    await test.enterText(usernameText, "Chirag1");
    Finder passwordText = find.byKey(const ValueKey("txtPassword"));
    await test.enterText(passwordText, "Abcd");

    Finder btnLogin = find.byKey(const ValueKey("btnLogin"));
    await test.tap(btnLogin);
    await test.pumpAndSettle();
    expect(find.text("Looking for Jobs?"),
        findsNothing); //verifies we are not on "Applicant" home screen
  });
  testWidgets("Finds Jobs container in homepage", (WidgetTester test) async {
    await test.pumpWidget(
      const MaterialApp(
        title: "Arithmetic",
        home: LoginScreen(),
      ),
    );

    Finder usernameText = find.byKey(const ValueKey("txtUsername"));
    await test.enterText(usernameText, "Chirag1");
    Finder passwordText = find.byKey(const ValueKey("txtPassword"));
    await test.enterText(passwordText, "Abcd");

    Finder btnLogin = find.byKey(const ValueKey("btnLogin"));
    await test.tap(btnLogin);
    await test.pumpAndSettle();

    expect(find.text("Chirag1"),
        findsWidgets); //verifies our name is displayed in the banner
  });
}
