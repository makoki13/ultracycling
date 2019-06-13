import 'package:flutter/material.dart';

import 'package:ultracycling/src/clases/ruta.dart';
import 'package:ultracycling/src/utils/icono_string_util.dart';

class RutasPage extends StatelessWidget {

  static final pageName = 'rutas';


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutas'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: FloatingActionButton(
              backgroundColor: Colors.cyan,
              child: Icon( Icons.add ),
              onPressed: () { Navigator.pushNamed(context, 'nueva'  ); },
            ),          
          ),          
        ],
      ),
      body: _lista(),
    );    
  }

  Widget _lista() {
    return FutureBuilder(
      future: Ruta.lista(),
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
      String nombre = opt['nombre']; 
      if (nombre.trim() == '') nombre = '(sin nombre)';
      final widgetTemp = ListTile(
        title: Text( nombre ),        
        leading:  getIcon( opt['estado'] ) ,
        subtitle: Text( opt['inicio'] ),
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () {},
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

  } 
}

