import 'package:empty/cat/bemen/m7/uf1/p5/samarretes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Pruebas funcionales - Samarretes', () {
    testWidgets('Cálculo de precio sin descuento', (WidgetTester tester) async {
      await tester.pumpWidget(SamarretesApp());

      // Introducir 2 camisetas M
      await tester.enterText(find.byType(TextField), '2');

      // Seleccionar talla M
      await tester.tap(find.text('M'));
      await tester.pump();

      // Verificar el resultado
      expect(find.text('Preu total: 20.00€'), findsOneWidget);
    });

    testWidgets('Cálculo de precio con descuento del 10%', (WidgetTester tester) async {
      await tester.pumpWidget(SamarretesApp());

      // Introducir 10 camisetas L (110€)
      await tester.enterText(find.byType(TextField), '10');

      // Seleccionar talla L
      await tester.tap(find.text('L'));
      await tester.pump();

      // Seleccionar el 10% de descuento
      await tester.tap(find.byType(DropdownButton<int>));
      await tester.pump();
      await tester.tap(find.text('10% de descompte').last);
      await tester.pump();

      // Verificar el resultado con descuento aplicado (110€ - 11€)
      expect(find.text('Preu total: 99.00€'), findsOneWidget);
    });

    testWidgets('Cálculo de precio con descuento de 20€ (>100€)', (WidgetTester tester) async {
      await tester.pumpWidget(SamarretesApp());

      // Introducir 10 camisetas L (110€)
      await tester.enterText(find.byType(TextField), '10');

      // Seleccionar talla L
      await tester.tap(find.text('L'));
      await tester.pump();

      // Seleccionar el descuento de 20€ si >100€
      await tester.tap(find.byType(DropdownButton<int>));
      await tester.pump();
      await tester.tap(find.text('20€ per comandes majors de 100€').last);
      await tester.pump();

      // Verificar el resultado con descuento aplicado (110€ - 20€)
      expect(find.text('Preu total: 90.00€'), findsOneWidget);
    });
  });
}
