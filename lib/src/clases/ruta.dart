import 'package:ultracycling/src/clases/jornada.dart';

class Ruta {
  String _id;

  String _nombre;  
  DateTime _inicio;
  String _comentarios;  

  List<Jornada> jornadas = new List<Jornada>(); 

  Ruta(String id) {
    this._id = id;
    _getFromStore(id);
  }

  Ruta.nueva(String nombre, DateTime inicio, String comentarios) {
    this._nombre = nombre;
    this._inicio = inicio;
    this._comentarios = comentarios;
    _addToStore(nombre, inicio, comentarios);
  }

  set id( String valor) {
    this._id = valor;
  }

  String get id {
    return this._id;
  }

  set nombre( String valor) {
    this._nombre = valor;
  }

  String get nombre {
    return this._nombre;
  }

  set inicio( DateTime valor) {
    this._inicio = valor;
  }

  DateTime get inicio {
    return this._inicio;
  }

  set comentarios( String valor) {
    this._comentarios = valor;
  }

  String get comentarios {
    return this._comentarios;
  }

  static List<Ruta> listaPendientes() {
    return null;
  }

  static List<Ruta> listaHistorico() {
    return null;
  }

  static List<Ruta> listaFavoritas() {
    return null;
  }

  void _getFromStore(String id) {        
    this._nombre = 'Nombre';
    this._inicio = new DateTime.now();
    this._comentarios = '';
  }

  static String _getNewID() {
    return 'aaaaa';
  }

  static void _addToStore(String nombre, DateTime inicio, String comentarios) {        
    String id = _getNewID();
    print(id);
  }
}