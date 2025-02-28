import 'package:empty/cat/bemen/m7/uf1/p5/samarretes_models.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SamarretesApp()); // Punto de entrada de la aplicación Flutter
}

class SamarretesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Samarretes', // Título de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema de la aplicación
      ),
      home: SamarretesHomePage(), // Página principal de la app
    );
  }
}

class SamarretesHomePage extends StatefulWidget {
  @override
  _SamarretesHomePageState createState() => _SamarretesHomePageState();
}

class _SamarretesHomePageState extends State<SamarretesHomePage> {
  int _numSamarretes = 0; // Número de samarretes
  String _talla = 'M'; // Talla seleccionada
  int _descompte = 0; // Tipo de descuento
  double _preu = 0.0; // Precio total calculado

  final List<String> _talles = ['S', 'M', 'L', 'XL']; // Lista de tallas disponibles
  final List<String> _descomptes = [ // Lista de opciones de descuento
    'Cap descompte', 
    '10% de descompte', 
    '20€ per comandes majors de 100€'
  ];

  // Método para calcular el precio total
  void _calculaPreu() {
    setState(() {
      _preu = preuDefinitiu(_numSamarretes, _talla, _descompte);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Samarretes'), // Título de la barra superior
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Margen alrededor de los elementos
        child: Column(
          children: [
            // Campo de texto para ingresar el número de samarretes
            TextField(
              decoration: InputDecoration(labelText: 'Nombre de samarretes'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _numSamarretes = int.tryParse(value) ?? 0;
                  _calculaPreu();
                });
              },
            ),
            SizedBox(height: 20),
            
            // Selector de talla con botones de radio
            Text('Selecciona la talla:'),
            Row(
              children: _talles.map((talla) {
                return Row(
                  children: [
                    Radio(
                      value: talla,
                      groupValue: _talla,
                      onChanged: (value) {
                        setState(() {
                          _talla = value!;
                          _calculaPreu();
                        });
                      },
                    ),
                    Text(talla),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            
            // Selector de descuento con DropdownButton
            DropdownButton<int>(
              value: _descompte,
              items: _descomptes.asMap().entries.map((entry) {
                return DropdownMenuItem<int>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _descompte = value!;
                  _calculaPreu();
                });
              },
            ),
            SizedBox(height: 20),
            
            // Muestra el precio total si hay al menos una samarreta seleccionada
            if (_numSamarretes > 0 && _talla.isNotEmpty)
                Text('Preu total: ${_preu.toStringAsFixed(2)}€'),
          ],
        ),
      ),
    );
  }
}