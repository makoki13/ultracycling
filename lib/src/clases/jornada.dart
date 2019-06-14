import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ultracycling/src/clases/ruta.dart';
import 'package:ultracycling/src/clases/tramo.dart';

class Jornada {
  Ruta _ruta;
  String _id;

  String _nombre;
  DateTime _inicio;
  String _comentarios;

  List<Tramo> _tramos = List<Tramo>();

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

  List<Tramo> get tramos {
    return this._tramos;
  }

  void addTramo(Tramo tramo) {
    this._tramos.add(tramo);
  }

  void _getFromStore(Ruta ruta, String id) {        
    this._nombre = 'Nombre';
    this._inicio = new DateTime.now();
    this._comentarios = '';

    //Pendiente los tramos
  }

  static String _getNewID(Ruta ruta) {
    return 'aaaaa';
  }

  static void _addToStore(Ruta ruta, String nombre, DateTime inicio, String comentarios) {  
    //Pendiente implementar      
    String id = _getNewID(ruta);
    print(id);
  }

  static Future<List<dynamic>> lista(String idRuta) async {
    List<dynamic> opciones = [];  
    final resp = await rootBundle.loadString('data/jornadas_lista.json');    
    Map dataMap = json.decode( resp );
    opciones = dataMap[idRuta];
    return opciones;
  }

}