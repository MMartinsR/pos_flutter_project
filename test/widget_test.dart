import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:pos_flutter_project/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.text('Acessar'), findsOneWidget);
    expect(find.text('Ainda não tenho cadastro!'), findsOneWidget);
    expect(find.text('Cadastrar'), findsNothing);

    await tester.tap(find.text('Ainda não tenho cadastro!'));
    await tester.pump();

    expect(find.text('Acessar'), findsNothing);
    expect(find.text('Cadastrar'), findsOneWidget);
  });
}
