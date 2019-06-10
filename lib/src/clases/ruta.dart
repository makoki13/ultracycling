


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

  static void nueva(String nombre, DateTime inicio, String comentarios) {
    _addToStore(nombre, inicio, comentarios);
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

  String getNombre() {
    return this._nombre;
  }

  String getID() { return this._id;}
}