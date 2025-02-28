
# Exercici 5 (proves unitàries)

## desenvolupament en mode TDD per a l'aplicació de samarretes

Aplicación Flutter para calcular precios de camisetas con sistema de descuentos, desarrollada con metodología TDD (Test-Driven Development).

## 📋 Características Principales
- ✅ Cálculo automático de precios en tiempo real
- 🧪 Pruebas unitarias completas para toda la lógica de negocio
- 🎨 Interfaz intuitiva con:
  - Selector de cantidad de camisetas
  - Radio buttons para tallas (S, M, L, XL)
  - Selector de descuentos (10%, 20€ en pedidos >100€)
- 💰 Sistema de descuentos configurable

## 🛠️ Tecnologías Utilizadas
- **Framework:** Flutter 3.13.9
- **Lenguaje:** Dart 3.1.3
- **Pruebas:** Paquete `test` (TDD)
- **Widgets Principales:**
  - `Radio` para selección de tallas
  - `DropdownButton` para descuentos
  - `TextField` para entrada numérica
- **Gestión de Estado:** `setState` con enfoque StatefulWidget

## 🧪 Desarrollo con TDD
Implementación siguiendo Test-Driven Development:

### 1. Pruebas Unitarias

#### Pruebas para cálculo básico de precio
test('Calcula preu sense descompte', () {
  expect(calculaPreuSamarretes(2, 'M'), equals(20.0));
});

#### Pruebas para descuento del 10%
test('Calcula descompte del 10%', () {
  expect(calculaDescompte(100.0, 1), equals(10.0));
});

#### Pruebas para descuento de 20€
test('Calcula descompte de 20€', () {
  expect(calculaDescompte(120.0, 2), equals(20.0));
});

#### Pruebas para precio final
test('Preu definitiu amb descompte 20€', () {
  expect(preuDefinitiu(10, 'L', 2), equals(90.0));
});

![alt text](image.png)
# 📦 Configuración de Dependencias (`pubspec.yaml`)

Sección relevante del archivo de configuración de Flutter con explicaciones técnicas:

```yaml
dependencies:
  flutter:
    sdk: flutter  # Dependencia principal del SDK de Flutter (obligatoria)
  
  test: ^1.24.0   # Versión 1.24.0 del paquete de testing para Dart (^ permite actualizaciones compatibles)
                   # Usado para pruebas unitarias de la lógica de negocio (TDD)
  
  flutter_test:
    sdk: flutter   # Paquete de testing específico para widgets Flutter (incluido en el SDK)
                   # Necesario para pruebas de interfaz de usuario y componentes visuales


```
### 2 .Implementación de Funciones

#### Cálculo de precio base
double calculaPreuSamarretes(int numero, String talla) {
  // Lógica de precios por talla
}

#### Cálculo de descuentos
double calculaDescompte(double preu, int tipusDescompte) {
  // Implementación de reglas de descuento
}

#### Cálculo de precio final
double preuDefinitiu(int numero, String talla, int descompte) {
  return calculaPreuSamarretes(numero, talla) - calculaDescompte(...);
}
### 3. Implementación de UI
Interfaz reactiva que actualiza automáticamente el precio

Validación de entrada de datos

Muestra condicional del precio solo con datos válidos
![alt text](image-1.png) ![alt text](image-2.png)

📂 Estructura del Código

lib/          
├── samarretes.dart     
test/    
└── test.dart # Pruebas unitarias (TDD)
  
  
  
# 📌 Samarretes App - Pruebas en Flutter

Este proyecto incluye pruebas unitarias e integración para garantizar la correcta funcionalidad de la aplicación.

## 📦 Dependencias añadidas
Para ejecutar las pruebas, se han agregado las siguientes dependencias en el archivo `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
```

### 🔹 `flutter_test`
Esta biblioteca permite escribir y ejecutar **pruebas unitarias** para funciones y widgets individuales.

### 🔹 `integration_test`
Se usa para pruebas de **integración**, que verifican flujos completos de la aplicación, interactuando con la UI.

---



### 2️⃣ Pruebas de Integración (`integration_test/`)
Las pruebas de integración validan la app en su conjunto, asegurando que los elementos de la UI y los cálculos funcionan correctamente.

Ejemplo de prueba en `integration_test/app_test.dart`:

```dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Calcula precio correctamente', (tester) async {
    await tester.pumpWidget(SamarretesApp());

    await tester.enterText(find.byType(TextField), '2');
    await tester.tap(find.text('M'));
    await tester.pump();

    expect(find.text('Preu total: 20.00€'), findsOneWidget);
  });
}
```

**Ejecutar pruebas de integración:**
```sh
flutter test integration_test/
```

---