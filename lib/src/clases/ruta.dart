import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:ultracycling/src/clases/jornada.dart';

class Rutas {  

  Rutas();

  static List<Ruta> _lista = [];
  static List<dynamic> opciones = [];  

  static Future <List<dynamic>> getRutas() async {      
    
    if (opciones.length > 0) return opciones;
    
    final resp = await rootBundle.loadString('data/rutas_lista.json');    
    Map dataMap = json.decode( resp );
    opciones = dataMap['lista'];

    opciones.forEach( (reg) {

      String id = reg['id']; 
      String nombre = reg['nombre']; 
      String clave = reg['clave']; 
      String strInicio = reg['inicio']; 
      DateTime inicio = DateTime.utc(1966);
      if (strInicio.trim() != '') inicio = DateTime.parse(strInicio);
      String comentarios = reg['comentarios']; 
      bool esFavorita = (reg['favorita'] == "1");
      String estado = reg['estado']; 
      
      Ruta nuevaRuta = Ruta.add(id, nombre, clave, inicio, comentarios, esFavorita, estado);
      _lista.add( nuevaRuta );
    
    });

    return opciones;
  }

  static List<Ruta> listaPendientes() {
    return null;
  }

  static List<Ruta> listaHistorico() {
    return null;
  }

  static Ruta getFavorita() {
    Ruta rutaFavorita = Ruta('ruta1');
    return rutaFavorita;
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

class Ruta {
  String _id;

  String _nombre;  
  String _clave = '';
  DateTime _inicio;
  String _comentarios;  
  bool _esFavorita = false;
  String _estado = '0';

  List<Jornada> _jornadas = new List<Jornada>(); 

  Ruta(String id) {
    this._id = id;
    _getFromStore(id);
  }

  Ruta.add(String id, String nombre, String clave, DateTime inicio, String comentarios, bool esFavorita, String estado) {
    this._id = id;
    this._nombre = nombre;
    this._clave = clave;
    this._inicio = inicio;
    this._comentarios = comentarios;    
    this._esFavorita = esFavorita;
    this._estado = estado;    
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
  /*
  static Future<List<dynamic>> lista() async {
    List<dynamic> opciones = [];  
    final resp = await rootBundle.loadString('data/rutas_lista.json');    
    Map dataMap = json.decode( resp );
    opciones = dataMap['lista'];
    return opciones;
  }
  */
}