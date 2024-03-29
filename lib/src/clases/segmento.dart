import 'package:ultracycling/src/clases/jornada.dart';
import 'package:ultracycling/src/clases/marcas.dart';
import 'package:ultracycling/src/clases/referencia.dart';
import 'package:ultracycling/src/clases/ruta.dart';
import 'package:ultracycling/src/clases/tramo.dart';

class Segmento {
  Ruta _ruta;
  Jornada _jornada;
  Tramo _tramo;
  
  int _ordinal;
  String _nombre;
  String _comentarios;

  Referencia _inicio;
  Referencia _fin;
  List<Marca> _marcas;

  Segmento(Ruta ruta, Jornada jornada, Tramo tramo, int ordinal) {
    this._ruta = ruta;
    this._jornada = jornada;
    this._tramo = tramo;
    
    this._ordinal = ordinal;

    _getFromStore(this._ruta, this._jornada, this._tramo, this._ordinal);
  }

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

    set comentarios (String valor) {
    this._comentarios = valor;
  }

  String get comentarios {
    return this._comentarios;
  }

  set inicio( Referencia valor) {
    this._inicio = valor;
  }

  Referencia get inicio {
    return this._inicio;
  }

  set fin( Referencia valor) {
    this._fin = valor;
  }

  Referencia get fin {
    return this._fin;
  }

  List<Marca> get marcas {
    return this._marcas;
  }

  void _getFromStore(Ruta ruta, Jornada jornada, Tramo tramo, int ordinal) {
    this._ruta = ruta;
    this._jornada = jornada;
    this._tramo = tramo;
    this._ordinal = ordinal;
    this._nombre = 'Nombre';
    
    //Pendiente inicio, fin, los segmentos y las marcas
  }

  static int _getNewOrdinal(Ruta ruta, Jornada jornada) {
    return 0;
  }

  static void _addToStore(Ruta ruta, Jornada jornada, int ordinal, String nombre, Referencia inicio, Referencia fin, String comentarios) {  
    //Pendiente implementar      
    int id = _getNewOrdinal(ruta, jornada);
    print(id);
  }
}