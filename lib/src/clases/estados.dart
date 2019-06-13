class ItemEstado {
  int cardinal;
  String nombre;
  String icono;

  ItemEstado(this.cardinal, this.nombre, this.icono);
}
class Estados {
  static List<ItemEstado> lista = List<ItemEstado>();

  Estados() {
    lista.add(ItemEstado(0,'Sin comenzar',''));
    lista.add(ItemEstado(1,'En curso',''));
    lista.add(ItemEstado(2,'Terminado',''));
    lista.add(ItemEstado(3,'Anulado',''));
  }

  static String nombreEstado( int cardinal ) { return lista.elementAt(cardinal).nombre; }
  static String iconoEstado( int cardinal ) { return lista.elementAt(cardinal).icono; }
}