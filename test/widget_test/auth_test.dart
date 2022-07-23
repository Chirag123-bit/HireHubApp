import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hirehub/screens/auth/Login.dart';

void main() {
  testWidgets("Login Widget Test", (WidgetTester test) async {
    await test.pumpWidget(
      const MaterialApp(
        title: "Arithmetic",
        home: LoginScreen(),
      ),
    );

    Finder usernameText = find.byKey(const ValueKey("txtUsername"));
    await test.enterText(usernameText, "Chirag");
    Finder passwordText = find.byKey(const ValueKey("txtPassword"));
    await test.enterText(passwordText, "Abcd");

    Finder btnLogin = find.byKey(const ValueKey("btnLogin"));
    await test.tap(btnLogin);
    await test.pump();
    expect(find.text("Chirag"), findsOneWidget);
  });
  testWidgets("Login Screen Test", (WidgetTester test) async {
    await test.pumpWidget(
      const MaterialApp(
        title: "Arithmetic",
        home: LoginScreen(),
      ),
    );

    Finder usernameText = find.byKey(const ValueKey("txtUsername"));
    await test.enterText(usernameText, "Chirag");
    Finder passwordText = find.byKey(const ValueKey("txtPassword"));
    await test.enterText(passwordText, "Abcd");

    Finder btnLogin = find.byKey(const ValueKey("btnLogin"));
    await test.tap(btnLogin);
    await test.pumpAndSettle();
    expect(find.text("continue"), findsNothing);
  });
  testWidgets("Home Page Test", (WidgetTester test) async {
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
    expect(find.byKey(const ValueKey("homeBanner")), findsOneWidget);
  });
}
