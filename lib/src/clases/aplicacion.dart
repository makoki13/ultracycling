import 'package:ultracycling/src/clases/ruta.dart';

class Aplicacion {
  Ruta _rutaFavorita;

  Aplicacion() {
    this._rutaFavorita = Rutas.getFavorita();
  }

  Ruta get rutaFavorita {
    return this._rutaFavorita;
  }
}