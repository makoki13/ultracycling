
import 'package:ultracycling/src/clases/marcas.dart';
import 'package:ultracycling/src/clases/referencia.dart';
import 'package:ultracycling/src/clases/segmento.dart';

class Tramos {  
  int _ordinal;
  String _nombre;

  Referencia inicio = Referencia('inicio');
  Referencia fin = Referencia('fin');
  List<Segmento> segmentos = List<Segmento>();
  List<Marca> marcas = List<Marca>();

  set ordinal( int valor) {
    this._ordinal = valor;
  }

  int get ordinal {
    return this._ordinal;
  }

  set nombre( String valor) {
    this._nombre = valor;
  }

  String get nombre {
    return this._nombre;
  }
}