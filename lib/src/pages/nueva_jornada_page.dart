
import 'package:flutter/material.dart';

class NuevaJornadaPage extends StatefulWidget {
  @override
  _NuevaJornadaState createState() => _NuevaJornadaState();
}

class _NuevaJornadaState extends State<NuevaJornadaPage> {

  String _ordinal = '';
  String _nombre = '';
  String _inicio  = ''; //Fecha y hora del comienzo de la jornada
  String _comentarios = ''; 
  String _distancia = '';
  String _duracion = '';
  String idRuta = 'PRIMER';

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva jornada de la ruta $idRuta'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: FloatingActionButton(
              backgroundColor: Colors.orangeAccent,
              child: Icon( Icons.save ),
              tooltip: 'Guardar la nueva jornada',
              onPressed: () => _salva(context),
            ),          
          ),          
        ],
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
           _crearOrdinal(),
          Divider(),
          _crearNombre(),
          Divider(),
          _crearInicio(context),
          Divider(),                    
          _crearComentarios(),
          Divider(),
          _crearDistancia(),
          Divider(),          
          _crearDuracion(),
          Divider(),          
        ],
      ),
    );
  }

  Widget _crearOrdinal() {
    return TextField(
      autofocus: true,      
      keyboardType: TextInputType.number ,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),        
        hintText: 'Ordinal de la ruta',
        labelText: 'Ordinal',
        helperText: 'Ordinal de la ruta',
        suffixIcon: Icon( Icons.text_fields ),
        icon: Icon( Icons.map )
      ),
      onChanged: (valor){
        setState(() {
          _ordinal = valor;
        });
      },
    );
  }

  Widget _crearNombre() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),        
        hintText: 'Nombre de la ruta',
        labelText: 'Nombre',
        helperText: 'Nombre de la ruta',
        suffixIcon: Icon( Icons.text_fields ),
        icon: Icon( Icons.map )
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearInicio( BuildContext context ) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de inicio del evento',
        labelText: 'Fecha del evento',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today )
      ),
      onTap: (){ 

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
    );
  }

  Widget _crearComentarios() {
     return TextField(   
      keyboardType: TextInputType.multiline,
      maxLines: null,   
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Notas',
        labelText: 'Notas de la ruta',
        suffixIcon: Icon( Icons.note ),
        icon: Icon( Icons.note_add )
      ),
      onChanged: (valor) =>setState(() {
        _comentarios = valor;
      })
    );
  }

  Widget _crearDistancia() {
    return Container(
      margin: const EdgeInsets.only(right: 150, left: 0),
      child: TextField(      
        keyboardType: TextInputType.number ,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(        
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),          
          ),          
          hintText: 'Distancia',          
          labelText: 'Distancia en kilometros',
                  
          suffixIcon: Icon( Icons.vpn_key ),
          icon: Icon( Icons.ac_unit )
        ),
        onChanged: (valor) =>setState(() {
          _distancia = valor;
        })
      ),
    );
  }

  Widget _crearDuracion() {
    return Container(
      margin: const EdgeInsets.only(right: 150, left: 0),
      child: TextField(      
        keyboardType: TextInputType.number ,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(        
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),          
          ),          
          hintText: 'Duracion',          
          labelText: 'Duracion en minutos',
                  
          suffixIcon: Icon( Icons.vpn_key ),
          icon: Icon( Icons.ac_unit )
        ),
        onChanged: (valor) =>setState(() {
          _duracion = valor;
        })
      ),
    );
  }
  
  _selectDate(BuildContext context) async {

    TimeOfDay picked = await showTimePicker(

      context: context,
      initialTime: new TimeOfDay.now()     
    );

    if ( picked != null ) {
      setState(() {
          _inicio = picked.toString();
          _inputFieldDateController.text = _inicio;
      }); 
    }

  }
  
  
  _salva ( BuildContext context ) {
    if (_nombre.trim() == '')
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {

          return AlertDialog(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
            title: Text('¡Atención!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('La jornada debe de tener al menos un nombre', textAlign: TextAlign.center,),                
              ],
            ),
            actions: <Widget>[              
              FlatButton(
                child: Text('Ok'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );

        }
      );
    else
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {

          return AlertDialog(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
            title: Text('GUARDANDO'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Se está guardando la jornada', textAlign: TextAlign.center,),                
              ],
            ),
            actions: <Widget>[              
              FlatButton(
                child: Text('Ok'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
      );
  }
}