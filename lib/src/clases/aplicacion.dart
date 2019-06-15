import 'package:ultracycling/src/clases/ruta.dart';

class Aplicacion {
  Ruta _rutaFavorita;

  Aplicacion() {
    this._rutaFavorita = Ruta.getFavorita();
  }

  Ruta get rutaFavorita {
    return this._rutaFavorita;
  }
}