// Función para calcular el precio de las samarretes según la talla
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

// Función para calcular el descuento aplicado al precio
double calculaDescompte(double preu, int tipusDescompte) {
  if (tipusDescompte == 1) {
    return preu * 0.10; // 10% de descuento
  } else if (tipusDescompte == 2 && preu > 100.0) {
    return 20.0; // Descuento de 20€ si el total supera los 100€
  }
  return 0.0;
}

// Función para calcular el precio final con descuento aplicado
double preuDefinitiu(int numero, String talla, int descompte) {
  double preu = calculaPreuSamarretes(numero, talla);
  double descompteAplicat = calculaDescompte(preu, descompte);
  return preu - descompteAplicat;
}