import 'package:flutter/material.dart';

void main() {
  runApp(SamarretesApp());
}

class SamarretesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Samarretes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SamarretesHomePage(),
    );
  }
}

class SamarretesHomePage extends StatefulWidget {
  @override
  _SamarretesHomePageState createState() => _SamarretesHomePageState();
}

class _SamarretesHomePageState extends State<SamarretesHomePage> {
  int _numSamarretes = 0;
  String _talla = 'M';
  int _descompte = 0;
  double _preu = 0.0;

  final List<String> _talles = ['S', 'M', 'L', 'XL'];
  final List<String> _descomptes = ['Cap descompte', '10% de descompte', '20€ per comandes majors de 100€'];

  void _calculaPreu() {
    setState(() {
      _preu = preuDefinitiu(_numSamarretes, _talla, _descompte);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Samarretes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            if (_numSamarretes > 0 && _talla.isNotEmpty)
              Text('Preu total: ${_preu.toStringAsFixed(2)}€'),
          ],
        ),
      ),
    );
  }
}

double calculaPreuSamarretes(int numero, String talla) {
  double preuUnitari = 0.0;
  switch (talla) {
    case 'S':
      preuUnitari = 8.0;
      break;
    case 'M':
      preuUnitari = 10.0;
      break;
    case 'L':
      preuUnitari = 11.0;
      break;
    case 'XL':
      preuUnitari = 12.0;
      break;
    default:
      preuUnitari = 0.0;
  }
  return numero * preuUnitari;
}

double calculaDescompte(double preu, int tipusDescompte) {
  if (tipusDescompte == 1) {
    return preu * 0.10;
  } else if (tipusDescompte == 2 && preu > 100.0) {
    return 20.0;
  }
  return 0.0;
}

double preuDefinitiu(int numero, String talla, int descompte) {
  double preu = calculaPreuSamarretes(numero, talla);
  double descompteAplicat = calculaDescompte(preu, descompte);
  return preu - descompteAplicat;
}