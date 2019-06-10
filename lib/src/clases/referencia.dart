

import 'package:ultracycling/src/clases/coordenada.dart';
import 'package:ultracycling/src/clases/localidad.dart';

class Referencia {
  String nombre;
  Coordenada coordenadas = Coordenada(0,0);
  Localidad localidad = Localidad('');
  String tipo;
  String notas; 

  Referencia(this.nombre);
}