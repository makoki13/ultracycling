
import 'package:flutter/material.dart';

class NuevaRutaPage extends StatefulWidget {
  @override
  _NuevaRutaState createState() => _NuevaRutaState();
}

class _NuevaRutaState extends State<NuevaRutaPage> {

  String _nombre = '';
  String _abreviatura  = '';
  String _comentarios = ''; 
  String _fecha  = '';
  bool _esFavorito = false;

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva ruta'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: FloatingActionButton(
              backgroundColor: Colors.orangeAccent,
              child: Icon( Icons.save ),
              tooltip: 'Guardar la nueva ruta',
              onPressed: () => _salva(context),
            ),          
          ),          
        ],
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNombre(),
          Divider(),
          _crearAbreviatura(),
          Divider(),          
          _crearFecha( context ),
          Divider(),
          _crearComentarios(),
          Divider(),
          _crearFavorito(),
          Divider(),          
        ],
      ),
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

  Widget _crearAbreviatura() {

    return Container(
      margin: const EdgeInsets.only(right: 150, left: 0),
      child: TextField(      
        maxLength: 6,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(        
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),          
          ),
          counterText: 'Letras ${ _abreviatura.length }',
          hintText: 'Abreviatura',
          helperText: 'Mñaximo 6 caracteres',
          labelText: 'Abreviatura',
                  
          suffixIcon: Icon( Icons.vpn_key ),
          icon: Icon( Icons.ac_unit )
        ),
        onChanged: (valor) =>setState(() {
          _abreviatura = valor;
        })
      ),
    )
    ;

  }

  
  Widget _crearFecha( BuildContext context ) {

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

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
          _fecha = picked.toString();
          _inputFieldDateController.text = _fecha;
      }); 
    }

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

  Widget _crearFavorito() {
    return Row(      
      children: <Widget>[        
        Icon(Icons.select_all),
        SizedBox(width: 20.0),   
        Text('¿Es ruta favorita?', textAlign: TextAlign.left, style: TextStyle(fontSize: 16.0 ) ),
        SizedBox(width: 00.0),   
        Expanded(
          child:
            GestureDetector(
              onTap: () { 
                print ("Tap del boton rojo"); 
                setState(() {
                  _esFavorito = !_esFavorito; //<--update alreadSaved
                });
              },
              child: Icon(
                 _esFavorito ? Icons.favorite : Icons.favorite_border,
                color:  _esFavorito ? Colors.red : null,                
                textDirection: TextDirection.ltr,
              ),         
            ),
        )
      ],
    );
    
    
    
    

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
                Text('La ruta debe de tener al menos un nombre', textAlign: TextAlign.center,),                
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
                Text('Se está guardando la ruta', textAlign: TextAlign.center,),                
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