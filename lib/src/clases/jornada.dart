


class Jornada {
  String _idRuta;
  String _id;

  String _nombre;
  DateTime _inicio;  
  String _comentarios;

  Jornada(idRuta, id) {
    this._idRuta = idRuta;
    this._id = id;
    _getFromStore(idRuta, id);
  }

  void nueva(String nombre, DateTime inicio, String comentarios) {
    _addToStore(this._idRuta, nombre, inicio, comentarios);
  }

  List<Jornada> lista(String idRuta) {
    return null;
  }

  void _getFromStore(String idRuta, String id) {        
    this._nombre = 'Nombre';
    this._inicio = new DateTime.now();
    this._comentarios = '';
  }

  static String _getNewID(String idRuta) {
    return 'aaaaa';
  }

  static void _addToStore(String idRuta, String nombre, DateTime inicio, String comentarios) {        
    String id = _getNewID(idRuta);
    print(id);
  }

}