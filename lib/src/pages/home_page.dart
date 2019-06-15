import 'package:flutter/material.dart';

import 'package:ultracycling/src/providers/menu_provider.dart';
import 'package:ultracycling/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ultracycling Route Planner',
          style: TextStyle(
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 8.0,
                color: Color.fromARGB(125, 0, 0, 255),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
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
        title: Text( opt['texto'] ),
        leading:  getIcon( opt['icon'] ) ,
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () {

          Navigator.pushNamed(context, opt['ruta'] );
        },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;
  }
}


