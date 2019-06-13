
import 'package:flutter/material.dart';

class NuevaPage extends StatefulWidget {
  @override
  _NuevaPageState createState() => _NuevaPageState();
}

class _NuevaPageState extends State<NuevaPage> {

  String _nombre = '';
  String _abreviatura  = '';
  String _comentarios = ''; 
  String _fecha  = '';

  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

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
              backgroundColor: Colors.cyan,
              child: Icon( Icons.save ),
              onPressed: () => _salva(context),
            ),          
          ),          
        ]
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
          hintText: 'Abreviatura (max. 6 caracteres)',
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

  Widget _crearComentarios(){

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


  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach( (poder){

      lista.add( DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));

    });

    return lista;

  }

  Widget _crearFavorito() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),   
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
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