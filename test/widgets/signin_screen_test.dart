import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pos_flutter_project/screens/signin_screen.dart';

void main() {
  testWidgets('description', (WidgetTester tester) async {
    await tester.pumpWidget(SigninScreen());

    final textFieldEmail = find.byKey(const Key('textFieldSigninEmail'));
    final textFieldSenha = find.byKey(const Key('textFieldSigninSenha'));
    final btnAcessar = find.text('Acessar');

    tester.enterText(textFieldEmail, "mariana@gmail.com");
    tester.enterText(textFieldSenha, "123456");
    tester.tap(btnAcessar);

    expect(textFieldEmail, findsOneWidget);
  });
}
