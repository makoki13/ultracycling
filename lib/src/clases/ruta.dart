import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:ultracycling/src/clases/jornada.dart';

class Ruta {
  String _id;

  String _nombre;  
  String _clave = '';
  DateTime _inicio;
  String _comentarios;  
  bool _esFavorita = false;

  List<Jornada> _jornadas = new List<Jornada>(); 

  Ruta(String id) {
    this._id = id;
    _getFromStore(id);
  }

  Ruta.nueva(String nombre, String clave, DateTime inicio, String comentarios, bool esFavorita) {
    this._nombre = nombre;
    this._clave = clave;
    this._inicio = inicio;
    this._comentarios = comentarios;    
    this._esFavorita = esFavorita;
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

  set clave( String valor) {
    this._clave = valor;
  }

  String get clave {
    return this._clave;
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

  set favorita ( bool valor ) {
    this._esFavorita = valor;
  }

  bool get favorita {
    return this._esFavorita;
  }

  List<Jornada> get jornadas {
    return this._jornadas;
  }

  void addJornada(Jornada jornada) {
    this._jornadas.add(jornada);
  }

  void _getFromStore(String id) {        
    this._nombre = 'Nombre';
    this._inicio = new DateTime.now();
    this._comentarios = '';

    //Pendiente las jornadas
  }

  /* Funciones estaticas *****************************************************/
  static Future<List<dynamic>> lista() async {
    List<dynamic> opciones = [];  
    final resp = await rootBundle.loadString('data/rutas_lista.json');    
    Map dataMap = json.decode( resp );
    opciones = dataMap['lista'];
    return opciones;
  }
  
  static List<Ruta> listaPendientes() {
    return null;
  }

  static List<Ruta> listaHistorico() {
    return null;
  }

  static Ruta getFavorita() {
    return null;
  }

  static String _getNewID() {
    return 'aaaaa';
  }

  static void _addToStore(String nombre, DateTime inicio, String comentarios) {        
    //Pendiente implementar      
    String id = _getNewID();
    print(id);
  }
}