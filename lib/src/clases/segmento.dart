import 'package:ultracycling/src/clases/marcas.dart';
import 'package:ultracycling/src/clases/referencia.dart';

class Segmento {
  int _ordinal;
  String _nombre;

  Referencia inicio;
  Referencia fin;
  List<Marca> marcas;

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