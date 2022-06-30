import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hirehub/screens/auth/Login.dart';

void main() {
  testWidgets("Add two numbers", (WidgetTester test) async {
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
    expect(find.text("Login: Successful"), findsOneWidget);
  });
}
