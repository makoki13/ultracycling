

class Localidad {  
  String _nombre;
  String pedania;
  String municipio;
  String codigoPostal;
  String comarca;
  String provincia;
  String comunidadAutonoma;
  String pais;

  Localidad (
    this._nombre, 
    {
      String this.pedania, 
      String this.municipio, 
      String this.codigoPostal, 
      String this.comarca, 
      String this.provincia,
      String this.comunidadAutonoma,
      String this.pais
    }
  ) {

  }
}