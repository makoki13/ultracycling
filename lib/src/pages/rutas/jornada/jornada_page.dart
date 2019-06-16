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
      /*
      Column (
        children: <Widget>[
          _cabecera(),
          SizedBox(height: 30.0),
          Column(
            children: <Widget>[
              _lista(),
            ] 
          )
          //_lista(),          
        ]
      ) 
      */     
    );
  }

  Widget _cabecera() {

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Text( 
              "J1",          
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
            title: Text('Texto de la jornada'),
            subtitle: Text('Aquí estamos con la descripción de la tajera que quiero que ustedes vean para tener una idea de lo que quiero mostrarles'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Eliminar jornada'),
                onPressed: () {},
              )              
            ],
          )
        ],
      ),
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
      final widgetTemp = ListTile(
        title: Text( nombre ),        
        leading:  Text(opt['ordinal'] ) ,
        subtitle: Text( opt['inicio'] ),
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () { Navigator.pushNamed(context, 'favorita'  ); },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

  } 

}


