import 'package:ultracycling/src/clases/ruta.dart';
import 'package:ultracycling/src/clases/tramos.dart';

class Jornada {
  Ruta _ruta;
  String _id;

  String _nombre;
  DateTime _inicio;
  String _comentarios;

  List<Tramos> tramos = List<Tramos>();

  Jornada(ruta, id) {
    this._ruta = ruta;
    this._id = id;
    _getFromStore(ruta, id);
  }

  void nueva(Ruta ruta, String nombre, DateTime inicio, String comentarios) {
    this._id = _getNewID(ruta);
    this._nombre = nombre; 
    this._inicio = inicio;
    this._comentarios = comentarios;

    _addToStore(this._ruta, nombre, inicio, comentarios);
  }

  set id( String valor) {
    this._id = valor;
  }

  String get id {
    return this._id;
  }

  set nombre (String valor) {
    this._nombre = valor;
  }

  String get nombre {
    return this._nombre;
  }

  set inicio (DateTime valor) {
    this._inicio = valor;
  }

  DateTime get inicio {
    return this._inicio;
  }

  set comentarios (String valor) {
    this._comentarios = valor;
  }

  String get comentarios {
    return this._comentarios;
  }

  List<Jornada> lista() {
    return null;
  }

  void _getFromStore(Ruta ruta, String id) {        
    this._nombre = 'Nombre';
    this._inicio = new DateTime.now();
    this._comentarios = '';
  }

  static String _getNewID(Ruta ruta) {
    return 'aaaaa';
  }

  static void _addToStore(Ruta ruta, String nombre, DateTime inicio, String comentarios) {        
    String id = _getNewID(ruta);
    print(id);
  }

}