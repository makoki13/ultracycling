import 'package:flutter/material.dart';
import 'package:ultracycling/src/clases/jornada.dart';

class JornadaPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ruta XXX Jornada YYY'),
        backgroundColor: Colors.deepOrange,
      ),
      body: 
        _lista()      
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: Jornada.listaTramos('ruta1','1'),
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

    opciones..add( 
      new ListTile(
        onTap: null,
        leading: new CircleAvatar(
          backgroundColor: Colors.red,
          child: Text('J1',style: TextStyle(color: Colors.white),),
        ),
        title: Row(
            children: <Widget>[
              new Expanded(child: new Text("First Name")),
              new Expanded(child: new Text("Last Name")),
              new Expanded(child: new Text("City")),
              new Expanded(child: new Text("Id")),
            ]
        ), 
      )
    )
            ..add( Divider() );
    

    data.forEach( (opt) {
      String nombre = opt['nombre'];       
      if (nombre.trim() == '') nombre = '(sin nombre)';
      String inicio = opt['inicio'];
      if (opt['esFinal']=='S') inicio += '\n${opt['fin']}'  ;
      inicio += "\n"+opt['distancia'].toString() + ' Kms.';
      inicio += "\n"+opt['tiempo'].toString() + '';
      final widgetTemp = ListTile(
        title: Text( nombre ),        
        leading:  Text(opt['ordinal'] ) ,
        subtitle: Text( inicio ),
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () { Navigator.pushNamed(context, 'favorita'  ); },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

  } 

}


