import 'package:test/test.dart';
import 'package:empty/cat/bemen/m7/uf1/p5/samarretes_models.dart';



void main() {
  // Grupo de pruebas para calcular el precio de las camisetas
  group('Calcula preu de samarretes', () {
    
    // Prueba para calcular el precio sin descuento
    test('Calcula preu sense descompte', () {
      expect(calculaPreuSamarretes(2, 'M'), equals(20.0));
      expect(calculaPreuSamarretes(3, 'L'), equals(33.0));
    });


    // Prueba para calcular el descuento del 10%
    test('Calcula descompte del 10%', () {
      expect(calculaDescompte(100.0, 1), equals(10.0));
      expect(calculaDescompte(50.0, 1), equals(5.0));
    });

    // Prueba para calcular el descuento de 20€ en pedidos mayores de 100€
    test('Calcula descompte de 20€ per comandes majors de 100€', () {
      expect(calculaDescompte(120.0, 2), equals(20.0));
      expect(calculaDescompte(90.0, 2), equals(0.0));
    });

    // Prueba para calcular el precio definitivo sin aplicar descuentos
    test('Calcula preu definitiu sense descompte', () {
      expect(preuDefinitiu(2, 'M', 0), equals(20.0));
    });

    // Prueba para calcular el precio definitivo con un descuento del 10%
    test('Calcula preu definitiu amb descompte del 10%', () {
      expect(preuDefinitiu(2, 'M', 1), equals(18.0));
    });

    // Prueba para calcular el precio definitivo con descuento de 20€ en pedidos mayores de 100€
    test('Calcula preu definitiu amb descompte de 20€ per comandes majors de 100€', () {
      expect(preuDefinitiu(5, 'L', 2), equals(55.0)); // 5 * 11 = 55, no se aplica descuento
      expect(preuDefinitiu(10, 'L', 2), equals(90.0)); // 10 * 11 = 110, se aplica descuento de 20€
    });
  });
}
