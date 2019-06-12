
import 'package:ultracycling/src/clases/jornada.dart';
import 'package:ultracycling/src/clases/marcas.dart';
import 'package:ultracycling/src/clases/referencia.dart';
import 'package:ultracycling/src/clases/ruta.dart';
import 'package:ultracycling/src/clases/segmento.dart';

class Tramo {  
  Ruta _ruta;
  Jornada _jornada;
  
  int _ordinal;
  String _nombre;
  String _comentarios;

  Referencia _inicio = Referencia('inicio');
  Referencia _fin = Referencia('fin');
  List<Segmento> _segmentos = List<Segmento>();
  List<Marca> _marcas = List<Marca>();

  Tramo(Ruta ruta, Jornada jornada, int ordinal) {
    this._ruta = ruta;
    this._jornada = jornada;
    this._ordinal = ordinal;

    _getFromStore(this._ruta, this._jornada, this._ordinal);
  }

  void nuevo(Ruta ruta, Jornada jornada, int ordinal, String nombre,  String comentarios, Referencia inicio, Referencia fin) {
    this._ruta = ruta;
    this._jornada = jornada;
    this._ordinal = _getNewOrdinal(ruta, jornada);
    this._nombre = nombre; 
    this._comentarios = comentarios;
    this._inicio = inicio;
    this._fin = fin;

    _addToStore(this._ruta, this._jornada, this._ordinal, this._nombre, this._inicio, this._fin, this._comentarios);
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

  List<Segmento> get segmentos {
    return this._segmentos;
  }

  List<Marca> get marcas {
    return this._marcas;
  }

  void _getFromStore(Ruta ruta, Jornada jornada, int ordinal) {
    this._ruta = ruta;
    this._jornada = jornada;
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