import 'package:flutter/material.dart';
import 'package:ultracycling/src/clases/jornada.dart';

class RutaPage extends StatelessWidget {
  const RutaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      minimum: EdgeInsets.only(top: 35.0),
      child: Scaffold (     
        resizeToAvoidBottomInset: true,         
        appBar: AppBar(          
          title: Text('Ruta XXXXXX'),
          actions: <Widget>[            
            Container(            
              padding: EdgeInsets.all(5.0),
              child: FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: Colors.orangeAccent,
                child: Icon( Icons.add ),
                onPressed: () { Navigator.pushNamed(context, 'nueva_jornada'  ); }, 
              ),          
            ),          
            Container(
              padding: EdgeInsets.all(5.0),
              child: FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: Colors.orangeAccent,
                child: Icon( Icons.edit ),
                onPressed: () { /*Navigator.pushNamed(context, 'edita_jornada'  ); */ }, //'nueva'   : ( BuildContext context ) => NuevaRutaPage(),      
              ),          
            ),
          ],
          backgroundColor: Colors.deepOrange,
        ),
        body: _lista(),
      )
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: Jornada.lista('ruta1'),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){

        return ListView(
          children: _listaItems( snapshot.data, context ),
        );

      },
    );
  } 

  List<Widget> _listaItems( List<dynamic> data, BuildContext context ) {
    final List<Widget> opciones = [];

    data.forEach( (opt) {
      String ordinal = opt['ordinal']; 
      String nombre = opt['nombre']; 
      if (nombre.trim() == '') nombre = '(sin nombre)';
      String kilometros = opt['distancia']; 
      if (kilometros.trim() == '') kilometros = '0';
      String duracion = opt['duracion']; 
      if (duracion.trim() == '') duracion = '00:00';
      
      final widgetTemp = ListTile(
        title: Text( nombre ),        
        leading:  Text( 
          ordinal,          
          style: TextStyle(   
            fontSize: 24.0 ,         
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(125, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 8.0,
                color: Color.fromARGB(125, 0, 0, 255),
              ),
            ],
          ),
        ) ,
        subtitle: Text( "${opt['inicio']} \nKm: ${opt['distancia']} · Duración: ${opt['duracion']}" ),
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () { Navigator.pushNamed(context, 'jornada'  ); },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

  }
}
  