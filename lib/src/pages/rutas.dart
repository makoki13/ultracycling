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
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya.jpg'),
              radius: 25.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
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
      final widgetTemp = ListTile(
        title: Text( opt['nombre'] ),        
        leading:  getIcon( opt['favorita'] ) ,
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () {},
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

  } 
}

